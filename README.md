# try-nvim

[try-nvim](https://github.com/theimpostor/try-nvim) is a set of pipe-to-shell scripts which will let you try out various [Neovim](https://neovim.io) distros without effecting your default Vim/Neovim installation (if any). The scripts will set up a copy of the latest stable Neovim (linux or mac only) in your home directory with a unique set of [XDG](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) directories which allow the different distros to operate completely independently of each other.

These scripts can also be used to quickly install Neovim on machines where root permissions are not available.

Uninstallation is simply deleting the directory where the distro was installed and it's launcher script under `$HOME/.local/bin`

# Prerequisites

Requires `curl`, `bash`, and `tar`. Also requires `git` to install plugins.

# Usage

## Neovim

```
curl -fsSL https://github.com/theimpostor/try-nvim/raw/refs/heads/main/neovim.sh | bash
```

Installs Neovim without any extra configuration to `$HOME/nvim`

## Neovim Kickstart

```
curl -fsSL https://github.com/theimpostor/try-nvim/raw/refs/heads/main/kickstart.sh | bash
```

Installs Neovim + [Kickstart](https://github.com/nvim-lua/kickstart.nvim) to
`$HOME/kvim`

## LazyVim

```
curl -fsSL https://github.com/theimpostor/try-nvim/raw/refs/heads/main/lazyvim.sh | bash
```

Installs [LazyVim](https://www.lazyvim.org/) to `$HOME/lvim`

## SpaceVim

```
curl -fsSL https://github.com/theimpostor/try-nvim/raw/refs/heads/main/spacevim.sh | bash
```

Installs [SpaceVim](https://spacevim.org/) to `$HOME/svim`

## AstroNvim

```
curl -fsSL https://github.com/theimpostor/try-nvim/raw/refs/heads/main/astronvim.sh | bash
```

Installs [AstroNvim](https://astronvim.com/) to `$HOME/avim`
