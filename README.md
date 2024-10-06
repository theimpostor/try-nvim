# try-nvim

Scripts to install standalone instances of various Neovim distros

Each script in this repo downloads the latest stable release of [Neovim](https://neovim.io/) (linux or
mac) in to the user's home directory and adds a script to `$HOME/.local/bin` to
launch the copy of Neovim with it's own config and data dirs. That way different
distros of Neovim can be installed and tried out without interfering with each
other.

# Prerequisites

Requires `curl`, `bash`, and `tar`.

# Usage

## Neovim

```
curl -L https://github.com/theimpostor/try-nvim/raw/refs/heads/main/neovim.sh | /bin/bash
```

Installs Neovim without any extra configuration to `$HOME/nvim`

## Neovim Kickstart

```
curl -L https://github.com/theimpostor/try-nvim/raw/refs/heads/main/kickstart.sh | /bin/bash
```

Installs Neovim + [Kickstart](https://github.com/nvim-lua/kickstart.nvim) to
`$HOME/kvim`

## LazyVim

```
curl -L https://github.com/theimpostor/try-nvim/raw/refs/heads/main/lazyvim.sh | /bin/bash
```

Installs [LazyVim](https://www.lazyvim.org/) to `$HOME/lvim`
