# mc-server-installer: An all-in-one script to setup minecraft servers
The **mc-server-installer** is a powerful and versatile script designed for effortless installation of minecraft servers. Whether you want to run a Spigot, Vanilla, Modded, Bungee or Bedrock server, this script simplifies the process into just a few steps, making it easy for both beginners and experienced users.

Additionally, it downloads everything from their OFFICIAL SOURCES, ensuring you have the latest and most secure versions. There are also various forks available for each server type, providing flexibility and support for different preferences.

## Features
- **Versatile server support:** install any type of minecraft server whether Spigot, Vanilla, Modded, Bungee or Bedrock quickly and efficiently
- **Latest stable versions:** always get the most recent and stable versions of your favorite minecraft server software
- ~~**Automatic java installation:** you don't even have to worry about Java as the script will take care of that and install it for you~~
- **Self-updating script:** enjoy new features and improvements without having to manually update the script, as it updates automatically

## Requirements
- A Debian or Ubuntu based system (missing packages are installed with `apt-get`)
- Java, to run the server: the script does not install it, but it tells you which version the server needs
- Python 3.11 or newer, only for Endstone (the script offers to install `python3-venv` if it is missing)
- Root or sudo permissions, only needed to install the missing packages

## How To Use
It's super easy! Just type in the following command as root or as a user with sudo permissions in order to commence with the installation. The server is installed in the home folder of the user who runs the script. After that the script will help you through the entire process of installing the server of your choice:
```bash
bash <(wget -O - 'https://raw.githubusercontent.com/samupro-dev/mc-server-installer/main/server-installer.sh')
```
#### OR
Alternatively, you can download the `server-installer.sh` file and execute it with the following command:
```bash
bash server-installer.sh
```

## Encountering Issues?
If you come across any bugs or have suggestions for new features, please don't hesitate to report them [here](https://github.com/samupro-dev/mc-server-installer/issues)

## To Do
- [ ] ~~Italian translation~~
- [x] Script optimization
- [x] More forks
- [x] ~~Java installation if it is not installed~~ (removed)
- [ ] A better interface?

## Changelogs
### v5.7
- Fixed issue where the Spigot fork could delete the files in the current folder if the install folder could not be created
- The Spigot jar is now built in a temporary folder, so the other files in the install folder are never touched
- Fixed issue where Spigot 26.x was built with the wrong Java version
- Fixed issue where Spigot 1.20.5 was built with the wrong Java version
- Fixed the modded menu: Youer, Fabric and Mohist now install the right fork and Cancel no longer installs Fabric
- Fixed issue where Mohist and Youer jars were not saved
- Fixed issue with Youer download links
- Fixed issue where the BungeeCord startup file pointed to the wrong jar
- Bedrock now uses the official Mojang download API and the right default port (19132)
- Fixed issue where Bedrock asked to overwrite server.properties during the installation
- Fixed issue where sudo users were not really running the script with root permissions: now sudo is asked only when a package must be installed (so a dedicated user without sudo can use the script) and the server is installed in the user's home folder
- Failed downloads now stop the script with an error instead of showing a successful installation
- The EULA must now be accepted explicitly and online-mode is enabled by default
- The RAM, port and max players values are now validated
- The script asks before installing in a folder that is not empty
- The startup file is no longer duplicated when reinstalling and works from any folder
- Forge 1.17+ now uses the RAM value chosen during the setup
- The RAM is asked only for the software that runs on Java, and the server settings (port, premium users, max players, EULA) only for the software that uses server.properties
- Reinstalling Forge or NeoForge in the same folder no longer adds the RAM line to user_jvm_args.txt again
- Added a warning when Java is not installed or too old for the selected version
- The Spigot version list loads much faster
- Added the Leaf, Canvas, DivineMC, ShreddedPaper, Sakura, Gale, PandaSpigot and Lophine forks to Spigot
- Added the NeoForge, Quilt and SpongeVanilla forks to modded
- Added the Velocity-CTD, Geyser (standalone), Gate, ViaProxy, WaterdogPE and Infrarust proxies, and the Limbo, PicoLimbo and NanoLimbo servers
- Added Pumpkin (a server for Java and Bedrock players, still in development) to vanilla
- The Forge, NeoForge, Quilt and ViaProxy installers now run with their own temporary Java, like the Spigot build, so Java is only needed to start the server
- The Java version used to build Spigot is now read from the official BuildTools data of each version
- Added the Endstone, Nukkit-MOT, Lumi and Allay Bedrock servers (Endstone needs Python 3.11 or newer)
- Removed the Pufferfish fork (no longer updated)
- Removed the Glowstone fork (no longer updated)
- Removed the Waterfall fork (end of life, use Velocity)
- Removed the CatServer fork (no longer updated and its download server is offline)
- Removed the SpongeForge fork (it is a Forge mod and could not start a server, use SpongeVanilla)
- Removed the Magma fork (its download API is offline)
- Mohist and Youer only show the versions that can be downloaded
- Arclight versions are now sorted by version
- Forge installs the recommended build when there is one
- Moved the shared code to common.sh
- Added automatic checks on GitHub: ShellCheck, unit tests and a real install and start of every server software, also run every week to notice download sources that stop working
- The package list is updated before installing the missing packages
- The installer now shows an error when a script cannot be downloaded instead of doing nothing
- Downloads now time out instead of hanging, and every file is checked with its official checksum when the source publishes one (all of them except Arclight, Canvas, Fabric, BungeeCord, Limbo, NukkitX, PowerNukkitX, Bedrock and the Spigot BuildTools; Endstone is installed with pip from PyPI)
- Versions received from the download sources are now validated before being used
- Spigot can now be built on ARM (aarch64) servers
- Bedrock shows a clear error on systems where the official server cannot run
- Reinstalling Bedrock no longer overwrites server.properties, allowlist.json and permissions.json
- The premium users option now also works for NukkitX
- Fixed the download of old Forge versions (1.7.10 - 1.9.4)
- Old modded servers now warn when Java 8 is not the installed version
- Server files are no longer readable by other users of the system
- Temporary files are removed even when the script is interrupted
### v5.6
- Added compilation support for Java 25 for Spigot jar 26.x
- Fixed issue with download links for Microsoft's Bedrock jar
- Fixed issue with NukkitX links
- Fixed issue with PowerNukkitX links
- Updated Mohist fork APIs
- Added Youer fork to modded
- Removed Krypton fork from modded
- Removed Banner fork from modded
### v5.5
- Fixed issue in the Spigot fork that was deleting files it shouldn't have
### v5.4
- Changed the Paper API links
- Now it checks if you have sudo access instead of being the root user
- Removed the option to install Java
- Changed the Arclight API links
- Removed version 1.15.2 and 1.14.4 of the Arclight fork
### v5.3
- Fixed issue with Bedrock script
- Removed custom options that conflict with Bungee
- Fixed small issue with starter.sh in Vanilla script
- Fixed issue with Spigot jar compilation
### v5.2
- Fixed issue with SpongeForge API links
- Fixed issue with startup script for modded
- Added new configuration options
- Improved the text of the scripts a bit
- Improved README
- Fixed issue where Fabric fork was not shown in modded script
### v5.1
- Arclight fork updated to 1.21.1
- From now on the Pufferfish jars will automatically update to the latest version available
- Added some checks in the installer
### v5.0
- Added java 21 check for Spigot 1.21 and up
### v4.9
- Improved Bedrock jar download script
- Added the Bedrock Preview fork
- Added java 21 for Spigot 1.20.5 fork
### v4.8
- From now on the Spigot jars will automatically update to the latest version available
- Replaced version 1.20.2 with 1.20.4 in the Pufferfish fork
- The user agent used in Bedrock will update automatically
### v4.7
- Replaced version 1.20.3 with 1.20.4 in the Spigot fork
- Arclight fork updated to 1.20.4
- Fixed a minor bug in the vanilla script
### v4.6
- Fixed issue where script could not be used
- Switched from java Oracle to java Azul Zulu for spigot compiler jre
- From now on the spigot compiler jre will automatically download the latest version
- Added -Xms argument to BuildTools
- Fixed issue where the java check showed as not installed even if installed
- Spigot fork updated to 1.20.3
- Fixed jre issue for various spigot versions
- Improved Arclight script
### v4.5
- Optimized all scripts
- Checks improved
- Code cleanup
- Removed yum commands
- From now on the Vanilla, Paper, Purpur, Waterfall, Velocity, Magma, SpongeForge and Mohist jars will automatically update to the latest version available
- Spigot fork updated to 1.19.4, 1.20.1 and 1.20.2
- Updated the JRE of the spigot compiler
- Updated Paper api url
- Updated Vanilla api url
- Removed the FlamePaper fork
- Removed the Airplane fork
- Pufferfish fork updated to 1.19.4 and 1.20.2
- Removed the Travertine fork
- Removed the FlameCord fork
- Removed the HexaCord fork
- Default -Xmx value changed to 2048M
- Added the Folia fork
- Updated Waterfall api url
- Updated Velocity api url
- Added the Forge fork
- Mohist fork updated to 1.19.4
- Arclight fork updated to 1.19.4, 1.20.1 and 1.20.2
- Added the PowerNukkitX fork
- Added the Krypton fork
- Added the Fabric fork
- Updated SpongeForge api url
- Updated Mohist api url
- Mohist fork updated to 1.18.2, 1.19.2, 1.20, 1.20.1 and 1.20.2
- Added the Banner fork
### v4.4
- Arclight fork updated to 1.19.3
- Spigot fork updated to 1.19.3
- Paper fork updated to 1.19.3
- Pufferfish fork updated to 1.19.3
### v4.3
- Paper fork updated to 1.19.2
- Updated the JRE of the spigot compiler
- Spigot fork updated to 1.19.2
- Fixed issue with Glowstone fork
- Added version 1.19 of the Glowstone fork
- Purpur fork updated to 1.19.2
- Pufferfish fork updated to 1.19.2
- Vanilla jar updated to 1.19.2
- Mohist fork updated to 1.19.2
- SpongeForge fork updated to 1.16.5
- SpongeForge fork updated to 1.9.4
- SpongeForge fork updated to 1.8.9
- Fixed the download links of the SpongeForge fork
- Removed 1.11 from the SpongeForge fork
- Removed 1.12 from the SpongeForge fork
- Removed 1.18.2 from the Mohist fork
- Removed the SportPaper fork
- Arclight fork updated to 1.19.2
- Fixed the download links of the Arclight fork
### v4.2
- Paper fork updated to 1.19.1
- Spigot fork updated to 1.19.1
- Purpur fork updated to 1.19.1
- Updated the JRE of the spigot compiler
- Magma fork updated to 1.18.2
- Vanilla jar updated to 1.19.1
### v4.1
- Improved the Vanilla installation
- Added the ability to download the latest snapshot in the vanilla installer
### v4.0
- Updated the JRE of the spigot compiler
- Improved the Spigot installation
- Improved the Paper installation
- Improved the Purpur installation
- Improved the Magma installation
- Improved the Mohist installation
- Added the Pufferfish fork
- Fixed issue with CatServer fork
- Optimized the scripts a bit
- Added the Crucible fork
- Fixed issue with Arclight fork
### v3.9
- Paper fork updated to 1.19
- Waterfall fork updated to 1.19
### v3.8
- Added comment to java installation
- Spigot fork updated to 1.19
- Purpur fork updated to 1.19
- Fixed issue with Airplane fork
- Vanilla jar updated to 1.19
### v3.7
- Fixed issue with modded script
### v3.6
- Added the CatServer fork
- Download link for the Magma fork updated
- Mohist fork updated to 1.18.2
- Removed 1.18.1 from the Mohist fork
- Fixed issue with Arclight fork
### v3.5
- Updated the JRE of the spigot compiler
### v3.4
- Fixed issue with choice of options
- Removed unused variables
### v3.3
- Added Bedrock jar with official Mojang links
- Download link for the FlameCord fork updated
- Download link for the FlamePaper fork updated
### v3.2
- Purpur fork updated to 1.18.2
- Paper fork updated to 1.18.2
- Spigot fork updated to 1.18.2
- Vanilla jar updated to 1.18.2
- Download link for the Velocity fork updated
- Added version 1.18.1 of the Mohist fork
- Fixed the download links of the Purpur 1.17.1 fork
- Updated the JRE of the spigot compiler
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
- Fixed issue with the spigot compiler
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
- Fixed link issue with Velocity fork
- Tuinity fork updated to 1.17.1
- Removed 1.17 from the Tuinity fork
- Paper fork updated to 1.17.1
- Spigot fork updated to 1.17.1
#### v1.8
- Fixed issue with Arclight fork
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
- Fixed issue with Vanilla jars
- The installer of the Spigot fork has been improved
- Spigot fork updated to 1.17
- Improved the installer.sh
#### v1.3
- Added the Arclight fork
- Fixed issue with modded installer
#### v1.2
- Added the FlamePaper fork
#### v1.1
- Fixed issue with FlameCord fork
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
- Fixed issue with java installation
#### v0.5
- Optimized all scripts
- Recoded the scripts
- Fixed issue with Yatopia fork
#### v0.4
- Now if the java installation refuses it does not exit the script
- Added Purpur fork
#### v0.3
- Fixed bug where the script would not close when the installation was finished
#### v0.2
- Fixed bug with colors
- Added support for CentOS
- Now it also checks if java is installed
