---
icon: material/debian
title: Debian Server
subtitle: Primary DNS Server
tags:
  - Hardware
  - Virtual Machine
  - Server
  - DNS
  - Infrastructure
  - Docker Host
  - Network
  - Linux
hide:
  - toc
---
![Debian Server Logo](../assets/icons/debian-server-light.svg#only-light){ width=200 }
![Debian Server Logo](../assets/icons/debian-server-dark.svg#only-dark){ width=200 }
&nbsp;![Intel Logo](../assets/icons/intel.svg){ width=50 }

# Debian Server
*Virtual Machine*

[Debian Docs :simple-debian:](https://www.debian.org/doc/){ .md-button .md-button--primary }

---
## :material-information-outline: Overview

#### :material-toolbox: Role:  

:    The primary DNS server in the [Technitium](../03_Services/Technitium.md) cluster. It is a VM hosted on the rack-mounted [ZimaOS NAS](./ZimaBoard_2_NAS.md).

#### :symbols-host: Hostname(s):

+ `debian-vm`

#### :symbols-stacks: Hypervisor: 

+ [:services-zimaos:&nbsp;ZimaOS](https://www.zimaspace.com/zimaos) *(KVM / QEMU)*

#### :material-memory: Operating System: 

+ [:material-debian:&nbsp;Debian Linux 13](https://www.debian.org/) *(Trixie)*

#### :material-server-network-outline: Host Node: 

+ [:material-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)

#### :material-key-chain: Credentials:

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com) 
    + SSH Keys&ensp;:material-arrow-right-thin:&ensp;"debian-vm (server-admin)"

## :symbols-monitor-heart: Resource Allocation:

|          vCPU          |  RAM  | Storage | VDI Location                             |
| :--------------------: | :---: | :------ | :--------------------------------------- |
| 2C / 2T *(VT-x, VT-d)* | 2 GB  | 50 GB   | `/media/nvme0n1p1/VM/debian-vm/cd175b11` |

## :material-lan: Network Configuration

| Interface | IP Address     | MAC Address         | Notes                                                                             |
| :-------: | :------------- | :------------------ | :-------------------------------------------------------------------------------- |
| `enp1s0`  | `192.168.50.6` | `52:54:00:28:BB:EA` | :material-lan-connect:&nbsp;Bridged Adapter *(Appears as separate device on LAN)* |

| Interface | VLAN                            | FQDN                 | DNS Servers | Gateway        |
| :-------: | :------------------------------ | :------------------- | :---------- | :------------- |
| `enp1s0`  | :material-security:&nbsp;VLAN50 | `debian-vm.internal` | `127.0.0.1` | `192.168.50.1` |

## :material-web: Services / Docker Containers

#### :material-linux: Native Linux:

|  Status  | Service                                                               |        Port(s)         | Role / Notes                                                                                   |
| :------: | :-------------------------------------------------------------------- | :--------------------: | :--------------------------------------------------------------------------------------------- |
| *Active* | [:material-console-network:&nbsp;SSH](../03_Services/SSH.md)          |          `22`          | Provides secure encrypted communications between two untrusted hosts over an insecure network. |
| *Active* | [:simple-syncthing:&nbsp;Syncthing](../03_Services/Syncthing.md)      | `8384` `22000` `21027` | Open decentralized file synchronization.                                                       |
| *Active* | [:services-technitium:&nbsp;Technitium](../03_Services/Technitium.md) |   `53` `443` `5380`    | An open-source authoritative as well as recursive DNS server.                                  |

#### :material-docker: Docker:

|  Status  | Service                                                       | Port(s) | Role / Notes                                                                                           |
| :------: | :------------------------------------------------------------ | :-----: | :----------------------------------------------------------------------------------------------------- |
| *Active* | [:services-beszel:&nbsp;Beszel](../03_Services/Beszel_Hub.md) | `45876` | Agent for Beszel Hub *(hosted on [Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md))*. |
| *Active* | [:services-dockge:&nbsp;Dockge](../03_Services/Dockge.md)     | `5001`  | A fancy, easy-to-use and reactive self-hosted Docker `compose.yaml` stack-oriented manager.            |

---
## :material-tools: Maintenance & Snapshots

!!! config "Critical Configurations"

    + Do not modify NTP settings or enable `systemd-timesyncd`. It has been replaced with `chrony`.
    + The VM is configured to boot automatically when the host server boots. 

        + If a ZimaOS update breaks this configuration it can be re-applied with the following command on the host machine:

            ```bash linenums="1"
            sudo virsh autostart <vm_name>
            ```

        + To disable the 'autostart' feature: (not recommended)
 
            ```bash linenums="1"
            sudo virsh autostart <vm_name> --disable
            ```
          
    + This server has email & push notifications configured for new SSH sessions and `unattended-upgrades`. See [Setup SSH Login Notification](../Linux_Tutorials/Setup_SSH_Login_Email_Notification.md) for documentation. 

#### :material-update: Update Policy:

+ The `unattended-upgrades` service is enabled for critical bug fixes and CVE patches to apply automatically.
+ Manual OS updates can be applied with the `apt` package manager. *(Standard Debian)*
  
    ```bash linenums="1"
    sudo apt update && sudo apt upgrade
    ```

+ Updates for services using a Docker image can be applied manually with `docker compose` or by using the update utility in [Dockge](../03_Services/Dockge.md)

!!! warning inline "Warning!"

    + The **KVM / QEMU** hypervisor on ZimaOS only supports external snapshots.
    + To create an external snapshot, run the following command as `root`: 
 
        ```bash linenums="1"
        virsh snapshot-create-as <vm_name> <snapshot-name> "External snapshot description" --disk-only --atomic
        ```

#### :material-camera: Snapshot Policy:

+ Perform external snapshots before major changes.

#### :material-backup-restore: Recovery:

+ If the VM is corrupted there are external snapshots to roll back to. 
+ Also, on the main storage pool on the [ZimaOS NAS](./ZimaBoard_2_NAS.md) in the `/media/Quick_Storage/Backup/virsh-backups` directory there is a backup disk image and XML settings file. 

<br>

#### :material-login: Fastfetch Login Preset:

Prints a customized Fastfetch preset with relevant information every time a new terminal session is started. 

1. Install Fastfetch: 

    ```bash linenums="1"
    sudo apt update
    sudo apt install fastfetch
    ```

2. Copy the `login.jsonc` preset file into the presets directory:

    ```bash linenums="1"
    sudo cp login.jsonc /usr/share/fastfetch/presets
    ```

3. Add the `fastfetch` command to the `~/.bashrc` file: 

    ```bash linenums="1"
    fastfetch -c login
    ```

##### Fastfetch Preset File

```json title="<code>/usr/share/fastfetch/presets/login.jsonc</code>" linenums="1" 
--8<-- "fastfetch-login-debian-vm.jsonc"
```

#### :material-console-line: Starship Terminal Prompt:

--8<-- "starship-note.md"

1. Install the latest version:

    ```bash linenums="1"
    curl -sS https://starship.rs/install.sh | sh
    ```

2. Add init script to shell's config file: 

    ```bash linenums="1"
    eval "$(starship init bash)"
    ```

3. Place the custom config file in the `~/.config` directory:

    ```toml title="<code>starship.toml</code>" linenums="1"
    --8<-- "starship-debian-vm.toml"
    ```