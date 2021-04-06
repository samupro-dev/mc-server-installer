# mc-server-installer

A multifunctional script to install a minecraft server in just a few steps.

## Features

* Spigot, Vanilla, Modded, Bungee, Bedrock server installer
* Download the latest stable versions
* Install Java automatically
* Self-updated script

## Usage
To use the installation scripts, simply run this command as root. This script will ask you what you want to install with a few simple steps

```bash
bash <(curl -s https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/updated-server-installer.sh)
```
#### OR
download the **updated-server-installer.sh** file and use the `chmod +x updated-server-installer.sh` command and start the installer with _./updated-server-installer.sh_

## Problems with the script?
If you find any bugs or want to recommend some new features, write them [here](https://github.com/samupro-dev/mc-server-installer/issues/new/choose)

## To do
- [ ] Italian translation
- [ ] Script optimization
- [ ] More forks
- [x] Java installation if it is not installed
- [ ] A better interface

## Changelogs
#### v0.3
- Fixed bug where the script would not close when the installation was finished
#### v0.2
- Fixed bug with colors
- Added support for CentOS
- Now it also checks if java is installed
