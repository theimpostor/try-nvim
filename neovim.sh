#!/usr/bin/env bash

set -o errexit -o errtrace -o pipefail -o nounset
function warn() {
    >&2 echo "$@"
}

function die() {
    local ec=$?; if (( ec == 0 )); then ec=1; fi
    warn "$@"; warn "died. backtrace:"
    local frame=0; while caller $frame; do ((++frame)); done
    exit $ec
}
trap die ERR

function usage() {
    cat <<EOF
Usage: $0 [options] [--] [ <DEST_DIR> ]

Install Neovim to <DEST_DIR>

<DEST_DIR> must not exist. Defaults to \$HOME/nvim

options:
    --help, -h
        Print this message
    --debug, -d
        Enable debug tracing
    --
        Stop parsing options
EOF
}

function main() {
    # MAIN
    while (($#)); do
        case $1 in
            --help|-h) usage; exit 0
                ;;
            --debug|-d) set -o xtrace
                ;;
            --) shift; break
                ;;
            -*) warn "Unrecognized argument: $1"; exit 1
                ;;
            *) break
                ;;
        esac; shift
    done

    for cmd in curl tar ; do
        if ! command -v $cmd >/dev/null 2>&1; then
            die "ERROR: '$cmd' not found in path"
        fi
    done

    if (( $# == 0 )); then
        DEST_DIR="$HOME/nvim"
    else
        DEST_DIR=$1; shift
    fi

    [[ -e "$DEST_DIR" ]] && die "Destination directory already exists: $DEST_DIR"

    mkdir -p "$DEST_DIR"

    DEST_DIR="$( cd "$DEST_DIR" && pwd )"

    OS=$(uname -s); readonly OS
    ARCH=$(uname -m); readonly ARCH

    # https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz (glibc >= 2.31), nvim-linux64/bin/nvim
    # https://github.com/neovim/neovim-releases/releases/download/stable/nvim-linux64.tar.gz (glibc >= 2.17), nvim-linux64/bin/nvim
    # https://github.com/neovim/neovim/releases/download/stable/nvim-macos-arm64.tar.gz, nvim-macos-arm64/bin/nvim
    # https://github.com/neovim/neovim/releases/download/stable/nvim-macos-x86_64.tar.gz, nvim-macos-x86_64/bin/nvim
    case $OS in
        Linux)
            # use the more portable version linked with glibc 2.17
            REPO=neovim/neovim-releases
            case $ARCH in
                x86_64)
                    PKG=nvim-linux64
                    ;;
                *) die "ERROR: unsupported ARCH: $ARCH" ;;
            esac
            ;;
        Darwin)
            REPO=neovim/neovim
            case $ARCH in
                x86_64)
                    PKG=nvim-macos-x86_64
                    ;;
                arm64)
                    PKG=nvim-macos-arm64
                    ;;
                *) die "ERROR: unsupported ARCH: $ARCH" ;;
            esac
            ;;
        *) die "ERROR: unsupported OS: $OS" ;;
    esac
    NEOVIM_PKG_URL="https://github.com/$REPO/releases/download/stable/$PKG.tar.gz"

    mkdir -p "$DEST_DIR/.cache"
    mkdir -p "$DEST_DIR/.config"
    mkdir -p "$DEST_DIR/.config/nvim"
    mkdir -p "$DEST_DIR/.local/share"
    mkdir -p "$DEST_DIR/.local/state"
    mkdir -p "$HOME/.local/bin"

    echo
    echo "Downloading Neovim from $NEOVIM_PKG_URL and extracting to $DEST_DIR"
    echo
    curl -fsSL https://github.com/$REPO/releases/download/stable/$PKG.tar.gz | tar xzC "$DEST_DIR"

    cat > "$HOME/.local/bin/nvim" <<EOF
#!/bin/bash

XDG_CONFIG_HOME="$DEST_DIR/.config" \
XDG_DATA_HOME="$DEST_DIR/.local/share" \
XDG_STATE_HOME="$DEST_DIR/.local/state" \
XDG_CACHE_HOME="$DEST_DIR/.cache" \
exec "$DEST_DIR/$PKG/bin/nvim" "\$@"
EOF

    chmod +x "$HOME/.local/bin/nvim"

    echo
    echo "Neovim installed to $DEST_DIR, start with $HOME/.local/bin/nvim"
}

main "$@"

# vim:ft=bash:sw=4:ts=4:expandtab
