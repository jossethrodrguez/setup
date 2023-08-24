what to do:
0. Install and config _git_ (commands below)
1. clone this repo in main directory
2. if you have files with this names, chage it name, for example: [file]_backup
3. mv each file from _setup_ directory to _main_. including _.git/_ directory
4. install depencies (shown below, like brew, ruby, node, etc)

If you have a local clone, you can update it by running the following commands.
```bash
git branch -m main setup
git fetch origin
git branch -u origin/setup setup
git remote set-head origin -a
```
```bash
# Update packages:
sudo apt update; sudo apt upgrade;
sudo apt install software-properties-common
```
# Table of Contents

- [Setup](#setup)
- [Git](#git)
  - [Linking to Github](#github)
- [Node.js](#nodejs)
- [Neovim](#neovim)

  
# Setup
(**Important**: First install **Git** and link to **GitHub** account)
1. clone this repository in home directory (`/home/<user>/` or `~`)
2. change the name of the older `.bashrc` file to `.bashrc.backup`
3. move the `.bashrc` of this repository to home directory
4. move `nvim` directory of this repository to the home `.config` repository, then move out `nvim` directory and remove the empty `.config` directory
5. finally move each file in this repo, one by one but left `.git` directory until the end, and delete the directory of this repository   
# [brew](https://brew.sh/)
```bash
# Run these two commands in your terminal to add Homebrew to your PATH:
    (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/josseth/.profile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# Install Homebrew's dependencies if you have sudo access:
    sudo apt-get install build-essential
#  For more information, see:
    https://docs.brew.sh/Homebrew-on-Linux
# We recommend that you install GCC:
    brew install gcc
# Run brew help to get started
# Further documentation:
    https://docs.brew.sh

openjdk@17 is keg-only, which means it was not symlinked into /home/linuxbrew/.linuxbrew,
because this is an alternate version of another formula.

If you need to have openjdk@17 first in your PATH, run:
  echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/openjdk@17/bin:$PATH"' >> ~/.profile

For compilers to find openjdk@17 you may need to set:
  export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/openjdk@17/include"


```
# [Git](https://git-scm.com/)
```bash
# Add Git's repository:
sudo add-apt-repository ppa:git-core/ppa 
# Install Git:
sudo apt update; sudo apt install git
# git settings:
# user config:
git config --global user.name <name>
git config --global user.email <email>
# branch config:
git config --global init.defaultBranch 'main'
# Git Alias:
git config --global alias.superlog "log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

# check config:
git config -l
```
## Linking to Github
```bash
# on main directory use:
ssh-keygen -t rsa -b 4096 -C <emailOnGithub>

# check the binary to connect keys is working:
eval $(ssh-agent -s)

# Add ssh key to the system:
ssh-add .ssh/id_rsa
```
# [Node.js](https://nodejs.org/en/)

```bash
# Check nodejs version in repositories:
apt-cache policy nodejs

# Purge repositories:
sudo apt purge nodejs

# Unpackage node:
tar -xf node-*

# Move from Downloads folder to nodejs folder in the main folder:
move node-* ~/nodejs/

#  inside, there is a bin folder who store dependencies, check version
./node -v

# Finally, make nodejs accessible for anywhere, edit .bashrc file and the path of node the next line:
export PATH=$PATH: <route>
# restart Shell
```

# [Neovim](https://neovim.io/)
Go to [The nvim documentation](https://github.com/neovim/neovim/releases/tag/stable) and download `nvim.appimage` and this file to `/usr/bin/nvim` using `sudo` privilege.
## Files and Directories structure
- `~/.config/nvim/init.vim`: Main file, load our configuration.
    - `lua/josseth/`
        - `core/`: 
          - `colorscheme.lua`: 
          - `keymap.lua`
          - `options.lua`
            
        - `plugins/`
          - `autopairs.lua`
          - `comment.lua`
          - `gitsigns.lua`
          - `lualine.lua`
          - `nvim-cmp.lua`
          - `nvim-tree.lua`
          - `telescope.lua`
          - `treesitter.lua`
          - `lsp/`
              - `lspconfig.lua`
              - `lspsaga.lua`
              - `mason.lua`
              - `null-ls.lua`
            
        - `plugins-setup.lua`
## Plugins
First install Plugin Manager:
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
 ```
(**important**: Open `plugins-setup.lua` file with Neovim and save it `:w`, this is necessary to install plugins) 
#### Plugin Manager
- [wbthomason/packer](https://github.com/wbthomason/packer.nvim) - Popular plugin manager

#### Dependency For Other Plugins
- [nvim-lua/plenary](https://github.com/nvim-lua/plenary.nvim) - Useful lua functions other plugins use

#### Preferred Colorscheme
- [bluz71/vim-nightfly-guicolors](https://github.com/bluz71/vim-nightfly-guicolors)

#### Navigating Between Neovim Windows and Tmux
- [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

#### Essentials
- [tpope/vim-surround](https://github.com/tpope/vim-surround) - manipulate surroundings with "ys", "ds", and "cs"
- [vim-scripts/ReplaceWithRegister](https://github.com/vim-scripts/ReplaceWithRegister) - replace things with register with "gr"
- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim) - toggle comments with "gc"

#### File Explorer
- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)

#### VS Code Like Icons
- [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)

#### Status Line
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

#### Fuzzy Finder
- [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) - Dependency for better performance
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy Finder

#### Autocompletion
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion plugin
- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - Completion source for text in current buffer
- [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path) - Completion source for file system paths

#### Snippets
- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet engine
- [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Useful snippets for different languages
- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - Completion source for snippet autocomplete

#### Managing & Installing Language Servers, Linters & Formatters
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)

#### LSP Configuration
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Bridges gap b/w mason & lspconfig
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Easy way to configure lsp servers
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - Smart code autocompletion with lsp
- [glepnir/lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim) - Enhanced uis for lsp
- [jose-elias-alvarez/typescript.nvim](https://github.com/jose-elias-alvarez/typescript.nvim) - Additional functionality for typescript server
- [onsails/lspkind.nvim](https://github.com/onsails/lspkind.nvim) - Vs Code Like Icons for autocompletion

#### Formatting & Linting
- [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) - Easy way to configure formatters & linters
- [jayp0521/mason-null-ls.nvim](https://github.com/jayp0521/mason-null-ls.nvim) - Bridges gap b/w mason & null-ls

#### Syntax Highlighting & Autoclosing Things
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Treesitter configuration
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Autoclose brackets, parens, quotes, etc...
- [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - Autoclose tags

#### Git
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Show line modifications on left hand side

