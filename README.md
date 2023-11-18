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
  - [Linking to Github](##github)
- [Node.js](#nodejs)
- [Neovim](#neovim)

  
# Setup
(**Important**: First install **Git** and link to **GitHub** account)
1. clone this repository in home directory (`/home/<user>/` or `~`)
2. change the name of the older `.bashrc` file to `.bashrc.backup`
3. move the `.bashrc` of this repository to home directory
4. move `nvim` directory of this repository to the home `.config` repository, then move out `nvim` directory and remove the empty `.config` directory
5. finally move each file in this repo, one by one but left `.git` directory until the end, and delete the directory of this repository


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
install a [NerdFont](https://www.nerdfonts.com/font-downloads)
use ```fc-list``` to check already fonts installed, and add new fonts to ```/usr/fonts/``` path
we are using [NvChad](https://nvchad.com/docs/quickstart/install), install ripgrep first
Go to [The nvim documentation](https://github.com/neovim/neovim/releases/tag/stable) and download `nvim.appimage` and this file to `/usr/bin/nvim` using `sudo` privilege.
## NvChad commands:
- ```<spc> th```: choose theme
- ```:TSInstall <language>``` , ```TSInstallInfo```: check info
- ```<CTRL> n```: nvim-tree
- ```<CTRL> ff```: telescope
- ```<spc> ch```: Cheat sheet
### Windows navigation:
- :vsp, :sp open windows (<CTRL> h, j, k, l)
- <spc> h, v : open terminal window 
### LSP config:
add new file called ```plugins.lua``` in: ```~/.config/nvim/lua/custom/```. and add the next lines:
```neovim
local plugins = {
    {
        "williamboman/mason.nvim",
        opts = {
                ensure_installed = {
                    "pyright"
            },
        },
    },   
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
}
return plugins
```
and add ```M.plugins = "custom.plugins``` to ```chadrc.lua``` file in the same folder.
restart neovim, and type: ```:MasonInstallAll``` command.

create a file ```~/.config/nvim/lua/custom/```, paste:
```
local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetype = {"python"},
})
```
type: ```:LspInfo``` 

# Android Development withot Android Studio
## Setting enviroment
Download [Android Command line tools](https://developer.android.com/studio), then execute this script in ```Downloads/``` directory:
```bash
unzip commandlinetools-linux*.zip -d android-sdk
mv android-sdk ~
mkdir ~/android-sdk/cmdline-tools/latest
cd ~/android-sdk/cmdline-tools
mv * latest/
~/android-sdk/cmdline-tools/latest/bin/sdkmanager "platform-tools"
```
Then...
```bash
~/android-sdk/cmdline-tools/latest/bin/sdkmanager "platform;android-30.0.3"
echo "export ANDROID_HOME=~/android-sdk" >> ~/.bashrc; source ~/.bashrc
cd ~
bash
```
Install [SDK manager](https://sdkman.io/install), and finally type ```sdk install gradle 7.5```

# Install PHP
```bash 
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt upgrade -y
sudo apt install php php-fpm
```
# Install Docker [tutorial here](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)
```bash 
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker
```
## Executing Docker without ```sudo``` command
```bash 
sudo usermod -aG docker ${USER}
su - ${USER}
groups
sudo usermod -aG docker username
```
## [Installing Docker compose](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04)
To make sure you obtain the most updated stable version of Docker Compose
you’ll download this software from its [official Github repository](https://github.com/docker/compose/releases).

First, confirm the latest version available in their releases page. 
At the time of this writing, the most current stable version is ```2.23.0.```.

The following command will download the ```2.23.0``` release 
and save the executable file at ```/usr/local/bin/docker-compose```, 
which will make this software globally accessible as ```docker-compose```:
```bash
sudo curl -L "https://github.com/docker/compose/releases/download/v2.23.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

Next, set the correct permissions so that the docker-compose command is executable:
```bash
sudo chmod +x /usr/local/bin/docker-compose
```
To verify that the installation was successful, you can run:
```bash
docker-compose --version
```

# Install jupyter notebook
first install [anaconda](https://www.anaconda.com/download). once it is downloaded run:
```bash 
~/Downloads/Anaconda*.sh
```

If you'd prefer that conda's base environment not be activated on startup, run the following command when conda is activated:
```bash 
conda config --set auto_activate_base false
```

- create enviroment ```conda create --name <name> python=<python version>``` (
  if enviroment doesn't start run  run ```source ~/.bashrc```
- update conda ```conda update -n base c defaults conda```
- list enviroment ```conda env list```
- activate enviroment ```conda activate  <name>```; deactivate ```conda deactivate```
- list installed package ```conda list```

## Jupyter notebook
```bash
conda install -c anacoda jupyter
```
How to change the default browser used by the jupyter notebook in Linux:
You can create jupyter_notebook_config.py by:
```bash
jupyter notebook --generate-config
```
Then you go to
```bash
~/.jupyter/jupyter_notebook_config.py
```
and change ```#c.NotebookApp.browser = '' ``` (maybe line 210)  
to for example:
```bash
c.NotebookApp.browser = '/usr/bin/google-chrome'
```
You can choose which ever browser is installed. 
You'll find the path for example by typing ```which firefox``` 
Do not forget to delete the #

Run Jupyter notebook ```jupyter notebook```

# Install NGINX
Update package information for configured sources and install some packages that
will assist in configuring the official NGINX package repository:
```bash
sudo apt-get update
sudo apt install -y curl gnupg2 ca-certificates lsb-release debian-archive-keyring
```
Download and save the NGINX signing key:
```bash 
curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
```
Use lsb_release to set variables defining the OS and release names, then create an apt source file:
```bash
OS=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
RELEASE=$(lsb_release -cs)
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/${OS} ${RELEASE} nginx" | tee /etc/apt/sources.list.d/nginx.list
```
Update package information once more, then install NGINX:
```bash
sudo apt-get update
sudo apt-get install -y nginx
nginx
```
# Install MySQL
```bash 
brew install mysql
# After installing
# We've installed your MySQL database without a root password. To secure it run:
    mysql_secure_installation

# MySQL is configured to only allow connections from localhost by default

# To connect run:
    mysql -u root

# To start mysql now and restart at login:
  brew services start mysql
# Or, if you don't want/need a background service you can just run:
#  /home/linuxbrew/.linuxbrew/opt/mysql/bin/mysqld_safe --datadir\=/home/linuxbrew/.linuxbrew/var/mysql
```
## Install MySQL workbench
```bash 
# Install Snap package manager
sudo apt update
sudo apt install snapd

# Install MySQL Workbench
sudo snap install mysql-workbench-community

#
error Cannot Connect to Database Server solution:
sudo snap connect mysql-workbench-community:password-manager-service
sudo snap connect mysql-workbench-community:ssh-keys
```
