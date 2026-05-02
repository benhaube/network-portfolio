---
icon: services/fluidd
tags:
  - Active
  - Service
  - Software
  - 3D-Printer
  - Native
hide:
  - toc
---
![Fluidd Icon](../assets/icons/fluidd.svg){ width=200 }

# Fluidd
[GitHub :material-github:](https://github.com/fluidd-core/fluidd){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://docs.fluidd.xyz/){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ A Web UI for managing the 3D-printer.

#### :symbols-settings-ethernet: Port(s): 
+ `80`
+ `4408`

#### :material-link-variant: URL / Access: 
+ <http://k1c-a71e.internal>
+ <http://192.168.50.153>
+ <http://k1c-a71e.internal:4408>
+ <http://192.168.50.153:4408>

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Fluidd @ K1C-A71E"

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                                                                     | Method                             | Container Name | Image |
| :-------------------------------------------------------------------------------------------------------------- | :--------------------------------- | :------------- | :---- |
| :material-printer-3d-nozzle:&nbsp;[Kacey (Creality^&copy;^ K1C) 3D-Printer](../02_Hardware/Kacey_3D-printer.md) | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :material-cog: Configuration

#### :symbols-install-desktop: Install:

```bash title="Setup Creality Helper Script" linenums="1"
--8<-- "install-helper-script.sh"
```

1. Enter the following command to download the Creality-Helper-Script to the `/usr/data/helper-script` directory.
2. Enter this command to run the Creality Helper Script.
3. If you encounter an issue to clone Helper Script repository, enter this command before cloning.

#### :material-file-cog: Config File Backup:

```json {title="backup-fluidd.json" linenums="1" .wrap-code}
--8<-- "fluidd.json"
```
