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
## Creating Android Project
```bash
mkdir workspace/android-projects/NewApp
mkdir workspace/android-projects/
cd workspace/android-projects/NewApp
gradle init
echo "// list of repositories to find plugins
pluginManagement {
  repositories {
    gradlePluginPortal()
    google()
    mavenCentral()
  }
}

//list repositories to find packages & libraries
dependencyResolutionManagement {
     repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
}
//name of gradle project
rootProject.name = 'myApps'
//include sub-project in app folder
include 'app'" > workspace/android-projects/NewApp/setting.gradle

echo "//list of plugins that may be required for sub-projects
plugins {
    id 'com.android.application' version '7.2.0' apply false
    id 'com.android.library' version '7.2.0' apply false
    id 'org.jetbrains.kotlin.android' version '1.6.10' apply false
}

//gradle task to clean the build directory
task clean(type: Delete) {
    delete rootProject.buildDir
}" > workspace/android-projects/NewApp/build.gradle

touch workspace/android-projects/NewApp/gradle.properties
echo "org.gradle.java.home = $JAVA_HOME" > workspace/android-projects/NewApp/gradle.properties
mkdir workspace/android-projects/NewApp/app
mkdir workspace/android-projects/NewApp/app/src
touch workspace/android-projects/NewApp/app/src/build.gradle
touch workspace/android-projects/NewApp/app/src/proguard-rules.pro

echo "// list of plugin required for building this project
plugins {
  id 'com.android.application'
}

// settings required for android plugin
android {
    namespace 'com.name.myapp' //directory of java class files

    compileSdkVersion 30 //compile app for this version of API
    defaultConfig {
        applicationId 'com.name.myapp' //set id for app
        minSdkVersion 16 //minimum API this app supports
        targetSdkVersion 30 //compile for this API
        versionCode 1
        versionName "1.0"
    }
    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'),
                    'proguard-rules.pro'
        }
    }
}" > workspace/android-projects/NewApp/app/src/build.gradle

echo "# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile" > workspace/android-projects/NewApp/app/src/proguard-rules.pro
```

