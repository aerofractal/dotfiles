# dotfiles
This is a repo containing my personal Dotfiles for configuration of my shell, prompt, and environment on Ubuntu 20.04 LTS.

## Finished product

### Ubuntu/Linux:

![Prompt](promptdotfiles.jpg)

### Windows PowerShell:

![PsPrompt](psprompt.png)

### Neovim:

![NeoVim](nvimpowerline.jpg)

# Table of Contents

- [Pre-requisites](#pre-requisites)
  - [Ubuntu](#ubuntu)
  - [Terminal environment](#terminal-environment)
    - [Font](#font)
    - [Windows Terminal Color Schemes](#windows-terminal-color-schemes)
- [Installation of 'beauty packages'](#installation-of-beauty-packages)
  - [Zsh](#zsh)
  - [Starship](#starship)
    - [Ubuntu/Linux:](#ubuntulinux-1)
    - [Windows PowerShell:](#windows-powershell-1)
    - [vim-plug for Neovim:](#vim-plug-for-neovim)
- [Configuration](#configuration)
  - [Setting zsh as the default shell](#setting-zsh-as-the-default-shell)
  - [Configuring PowerShell 7](#configuring-powershell-7)
  - [Neovim powerline, and other plugins](#neovim-powerline-and-other-plugins)
- [Further configuration](#further-configuration)
- [Setting up the development environment](#setting-up-the-development-environment)
  - [Node.js Version Manager (NVM)](#nodejs-version-manager-nvm)
  - [SQLite3](#sqlite3)
  - [Yarn](#yarn)
  - [Ruby Version Manager (RVM)](#ruby-version-manager-rvm)
  - [Ruby](#ruby)
  - [Rails](#rails)
- [Development environment IDE integration](#development-environment-ide-integration)
- [Conclusion](#conclusion)

# Pre-requisites

## Ubuntu
You will need `NO LATER` than:

* `Ubuntu 20.04.4 LTS`

If you install a version of Ubuntu later than this one, setting up the development environment later in these instructions will not work.

I use Ubuntu on WSL2, whcih can be installed using.
```powershell
PS C:\> wsl --install -d Ubuntu
```
Now the main-line version of Ubuntu for WSL2 is Ubuntu 20.04.4 LTS, but if that changes int the future, you can install it directly by issuing `wsl --install -d Ubuntu-20.04` instead.

## Terminal environment
Since I use Ubuntu on top of WSL2 on Windows, I opted to use `Windows Terminal` instead of the built in command shell/terminal program that comes with WSL2, or the Windows command shell environment.

An important distinction to note is that I am not using the main-line `Windows Terminal` release here, but I am using the `Windows Terminal Preview`, which can be found in the Microsoft Store here: https://www.microsoft.com/store/productId/9N8G5RFZ9XK3

### Font

I am using the `JetBrains Mono NerdFont` in Windows Terminal, which is important because to get the icons in Starship (my zsh prompt) and listings with exa to work, you need a nerdfont with built in icons.

I downloaded the font I use from here:

https://www.nerdfonts.com/font-downloads

### Windows Terminal Color Schemes

Attached to this repository is:

`colorschemes.json`

Which contains code for several colorschemes that [The Digital Life](https://www.youtube.com/c/TheDigitalLifeTech), (my setup is largely pulled from his dotfiles); put together. The link above goes to his YouTube channel, and you can find his code here on GitHub:
* Profile: [@xcad2k](https://github.com/xcad2k)
* Link to his dotfiles repo: [xcad2k/dotfiles](https://github.com/xcad2k/dotfiles)

Go give him some love, and thank him for these awesome dotfiles!

# Installation of 'beauty packages'

## Zsh

Zsh can be installed on Ubuntu by issuing:
```
$ sudo apt install zsh
```
Latest version is fine.

## Starship

Starship can be found at this website: https://starship.rs/

### Ubuntu/Linux:

Installation is done using a variety of different package managers, but I opted to go with the direct installation from their website:
```
$ curl -sS https://starship.rs/install.sh | sh
```

### Windows PowerShell:

On PowerShell 7 using the [Chocolatey Package Manager](https://chocolatey.org/install):
```powershell
PS C:\> choco install starship
```
### vim-plug for Neovim:

vim-plug can be found on GitHub, referednce their documentation for installation on platforms other than Neovim on Ubuntu/Linux.

[junegunn/vim-plug](https://github.com/junegunn/vim-plug)

To install vim-plug for Neovim, run:
```
$ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
We will go over configuration of the plugins needed to make Neovim look like mine above in the next section.

# Configuration

## Setting zsh as the default shell

```
$ chsh -s /usr/bin/zsh
```

Restart Windows Terminal and re-open Ubuntu. The Zsh initial setup script will run. Choose option `0` to create an empty `.zshrc` file and exit, as we will put my .zshrc in its place.

If you've cloned my Dotfiles repo, now is a good time to put my .zshrc file in your home directory, but do not restart Windows Terminal until you have

`.config/starship.toml`

in place, or Starship will boot as a blank prompt.

## Configuring PowerShell 7

If you've cloned and are using my dotfiles, make sure that `starship.toml` is in a directory in your Home folder labeled `.starship`, like so:

`C:\Users\Noah Ramsey\.starship\starship.toml`

You will add this statement to your `$PROFILE` file for PowerShell, (you can find my PS profile included in this repo), to invoke Starship:
```powershell
Invoke-Expression (&starship init powershell)
```

## Neovim powerline, and other plugins

After installing vim-plug, make sure init.vim is in place at:

`~/.config/nvim/init.vim`

One of the plugins in my init.vim file needs Node.js v12 or newer to function. If you don't plan on using nvm like I do in my development environment, you can install Node.js through your distrobution's official repository.

If you plan on configuring your development environment to match mine, uninstall any versions of Node.js and NPM on your system, in preperation for installing NVM in the next section.

# Further configuration

If you are using my Dotfiles, at this point setting up Zsh, Starship and Neovim are complete. If you'd like to configure these applications further, refer to the Zsh documentation, the Starship website above, and the official Neovim documentation.

# Setting up the development environment

## Node.js Version Manager (NVM)

NVM has an offical GitHub repository, you can find it at the link below:

* [nvm-sh/nvm](https://github.com/nvm-sh/nvm)

Install NVM by running this command, (make sure you have cURL installed):
```
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```
My `.zshrc` file is already configured to set up the $NVM_DIR variable, and source the nvm.sh script to make NVM work.

At this point, you can restart your terminal and install Node.js by running:
```
$ nvm install node --lts
```
and
```
$ nvm install node
```
I run both the current and LTS versions of Node.js, you can switch between versions of Node by using the `nvm use` command, like so:
```
$ nvm use --lts
```
At this point NVM and Node are installed and working, and we can move on to preparing the environment for RVM and Ruby.

## SQLite3

Ruby and RVM require SQLite3 as a database system to function properly. If you know how to program with Ruby on Rails, you know you can change the database system, so if you would like to use PostgreSQL or MongoDB instead, please refer to their respective documentations and the Ruby documentation.

I just use SQLite3 in my environment however, and Ubuntu has it in its official repositories. You can install it by issuing:
```
$ sudo apt install sqlite3 libsqlite3-dev
```
Please note that `libsqlite3-dev` is required for the Ruby Bundler when generating Rails applications.

## Yarn
I beleive Yarn comes pre-installed on most linux distrobutions. However, if you don't ahve it installed, you can get it from the official Ubuntu repository:
```
$ sudo apt install yarn
```

## Ruby Version Manager (RVM)
At this point all of the pre-requisites for running Ruby and Ruby on Rails in my development environment are in place, and now it's time to install RVM.

During my initial configuration of my development environment, I referenced [this](https://www.freecodecamp.org/news/how-to-install-rails-on-ubuntu-and-update-ruby-to-the-latest-version/) tutorial at Free Code Camp to set up RVM, Ruby and Rails the first time. RVM has only one pre-requisite:
```
$ sudo apt install software-properties-common
```
After that we need to add the RVM repositroy from the Ubuntu PPA (Personal Package Archive):
```
$ sudo apt-add-repository -y ppa:rael-gc/rvm
```
Now we will update the list of available packages and install RVM:
```
$ sudo apt update && sudo apt install rvm
```
RVM is now installed, and we can move on to installing Ruby and Rails.

## Ruby
With RVM installed, installing Ruby is as easy as running:
```
$ rvm install ruby
```
This will install the latest stable main-line version of Ruby, which at the time of writing is Ruby v3.0.0

## Rails
With Ruby installed, you can install the Rails gem globally by running:
```
$ gem install rails
```
This will install the latest stable main-line version of Rails, which at the time of writing is Rails v7.0.3

That's it, the development environment is now fully set up!

You should now have:
```
rvm 1.29.12
nvm 0.39.1
node 16.15.0
npm 8.5.5
yarn 0.32+git
sqlite3 3.31.1
ruby 3.0.0p0
rails 7.0.3
```
# Development environment IDE integration
Using WSL2 has the perk that Windows has a pretty seamless integration with the subsystem, making VSCode the ideal editor/IDE to use with this environment.

I use VSCode with the WSL Remote Subsystem, which automatically installs itself the first time you run:
```
$ code
```
on WSL2.

# Conclusion

That's all there is! You are now fully configured with my Dotfiles and my development environment. I hope you enjoy, and if you find problems or have suggestions for improvement, please email me directly or open an issue on the GitHub repo.

Thanks!
