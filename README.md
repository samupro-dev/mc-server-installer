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
bash <(wget -O - 'https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/updated-server-installer.sh')
```
#### OR
download the **updated-server-installer.sh** file and use the `chmod +x updated-server-installer.sh` command and start the installer with _./updated-server-installer.sh_

## Problems with the script?
If you find any bugs or want to recommend some new features, write them [here](https://github.com/samupro-dev/mc-server-installer/issues/new/choose)

## To do
- [ ] Italian translation
- [x] Script optimization
- [x] More forks
- [x] Java installation if it is not installed
- [ ] A better interface

## Changelogs
### v3.1
- Fixed the download links of the Airplane fork
### v3.0
- Updated the 1.17.1 jar of the Purpur fork from hotfix2 to hotfix3
### v2.9
- Fixed the download links of the Purpur fork
### v2.8
- Removed 1.16.5 from the Airplane fork
- Purpur fork updated to 1.18.1
- Removed the Tuinity fork
- Paper fork updated to 1.18.1
- Spigot fork updated to 1.18.1
- Vanilla jar updated to 1.18.1
- Download links for the Arclight 1.17.1 fork updated
### v2.7
- Fixed the download links of the FlamePaper fork
### v2.6
- Updated from Java16 to Java17
- Improved Java installation option
### v2.5
- Purpur fork updated to 1.18
- Fixed the download links of the Purpur fork
- Fixed the download links of the Magma fork
- Fixed the download links of the Paper fork
- Fixed the download links of the Travertine fork
- Fixed the download links of the Waterfall fork
### v2.4
- Vanilla jar updated to 1.18
- Paper fork updated to 1.18
- Spigot fork updated to 1.18
- Waterfall fork updated to 1.18
- Arclight fork updated to 1.18
- Added version 1.17.1 of the Arclight fork
### v2.3
- Fixed problem with the spigot compiler
- Updated the JRE of the spigot compiler
### v2.2
- Fixed color issue in the installer
- Added default options if left blank
### v2.1
- Updated from Java11 to Java16
### v2.0
- Added version 1.16.5 of the Magma fork
- Removed the Yatopia fork
- Download links for the Purpur fork updated
- Download link for the FlamePaper fork updated
- Added the Airplane fork
### v1.9
- Vanilla jar updated to 1.17.1
- Purpur fork updated to 1.17.1
- Fixed link problem with Velocity fork
- Tuinity fork updated to 1.17.1
- Removed 1.17 from the Tuinity fork
- Paper fork updated to 1.17.1
- Spigot fork updated to 1.17.1
#### v1.8
- Fixed problem with Arclight fork
- Added the SpongeForge fork
#### v1.7
- Fixed a word in the spigot installer
#### v1.6
- Yatopia fork updated to 1.17
- Tuinity fork updated to 1.17
- Purpur fork updated to 1.17
#### v1.5
- Waterfall fork updated to 1.17
- Paper fork updated to 1.17
#### v1.4
- Vanilla jar updated to 1.17
- Fixed problem with Vanilla jars
- The installer of the Spigot fork has been improved
- Spigot fork updated to 1.17
- Improved the installer.sh
#### v1.3
- Added the Arclight fork
- Fixed problem with modded installer
#### v1.2
- Added the FlamePaper fork
#### v1.1
- Fixed problem with FlameCord fork
#### v1.0
- Update the download link of the FlameCord fork
- Added the SportPaper fork
- Fixed issue with the Glowstone fork
#### v0.9
- Added the Mohist fork
#### v0.8
- Changed the download link of the Vanilla jar with the official Mojang link
#### v0.7
- Startup file renamed
- Added small text on using the startup file
#### v0.6
- Fixed problem with java installation
#### v0.5
- Optimized all scripts
- Recoded the scripts
- Fixed problem with Yatopia fork
#### v0.4
- Now if the java installation refuses it does not exit the script
- Added Purpur fork
#### v0.3
- Fixed bug where the script would not close when the installation was finished
#### v0.2
- Fixed bug with colors
- Added support for CentOS
- Now it also checks if java is installed
