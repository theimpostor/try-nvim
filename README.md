# try-nvim

Scripts to install standalone instances of Neovim or a Neovim distro.

Each script in this repo downloads the latest stable release of [Neovim](https://neovim.io/) (linux or
mac) in to the user's home directory and adds a script to `$HOME/.local/bin` to launch Neovim with it's own
[XDG](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) directories. This allows multiple installations of Neovim to coexist with separate configuration, plugins, and themes etc.

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
