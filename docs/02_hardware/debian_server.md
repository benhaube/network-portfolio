---
icon: symbols/layers
title: Debian Server
subtitle: Primary DNS Server
description: The primary DNS server in the Technitium cluster. It is a VM hosted on the rack-mounted ZimaOS NAS.
tags:
  - Container Host
  - DNS
  - Hardware
  - Infrastructure
  - Linux
  - Network
  - Server
  - Virtual Machine
hide:
  - toc
---

![Lucide 'server' icon](../assets/icons/layers.svg){ width=200 }

# Debian Server

_Primary DNS Server_

[Debian Docs&ensp;:brands-debian:](https://www.debian.org/doc/){ .md-button .md-button--primary }&emsp;[KVM Docs&ensp;:symbols-layers:](https://docs.kernel.org/6.0/virt/kvm/index.html){ .md-button .md-button--primary }&emsp;[QEMU Docs&ensp;:services-qemu:](https://www.qemu.org/docs/master/){ .md-button .md-button--primary }

---

## :symbols-info:&ensp;Overview

#### :symbols-toolbox:&ensp;Role

:    The primary DNS server in the [Technitium](../03_services/technitium.md#description){ data-preview } cluster. It is a VM hosted on the rack-mounted [ZimaOS NAS](zimaos_nas.md#role){ data-preview }.

#### :symbols-host:&ensp;Hostname

:    `debian-vm`

#### :symbols-layers:&ensp;Hypervisor 

:    [:services-zimaos:&ensp;ZimaOS](https://www.zimaspace.com/zimaos){ external-link } _(KVM / QEMU)_

#### :symbols-cpu:&ensp;Operating System 

:    [:brands-debian:&ensp;Debian Linux](https://www.debian.org/){ external-link } _(trixie)_

#### :symbols-network-node:&ensp;Host Node 

:    [:symbols-server-nas:&ensp;ZimaOS NAS](zimaos_nas.md#virtualization){ data-preview }

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }

    - SSH Keys&ensp;:symbols-move-right:&ensp;"debian-vm (server-admin)"

## :symbols-square-activity:&ensp;Resource Allocation

|          vCPU          | RAM { data-sort-method="filesize" } | Storage { data-sort-method="filesize" } | VDI Location                             |
| :--------------------: | :---------------------------------: | :-------------------------------------- | :--------------------------------------- |
| 2C / 2T _(VT-x, VT-d)_ |                2 GB                 | 50 GB                                   | `/media/nvme0n1p1/VM/debian-vm/cd175b11` |

## :symbols-network:&ensp;Network Configuration

| Interface | IP Address { data-sort-method="dotsep" } | MAC Address         | Notes { data-sort-method="none" }                                             |
| :-------: | :--------------------------------------- | :------------------ | :---------------------------------------------------------------------------- |
| `enp1s0`  | `192.168.50.6`                           | `52:54:00:28:BB:EA` | :symbols-workflow:&nbsp;Bridged Adapter _(Appears as separate device on LAN)_ |

| Interface |             VLAN             | FQDN                 | DNS Servers { data-sort-method="dotsep" } | Gateway { data-sort-method="dotsep" } |
| :-------: | :--------------------------: | :------------------- | :---------------------------------------- | :------------------------------------ |
| `enp1s0`  | :symbols-shield:&nbsp;VLAN50 | `debian-vm.internal` | `127.0.0.1`                               | `192.168.50.1`                        |

## :symbols-cloud:&ensp;Services & Containers

#### :symbols-tux:&ensp;Native Linux

|  Status  | Service                                                                | Port(s) { data-sort-method="number" } | Role / Notes { data-sort-method="none" }                                                       |
| :------: | :--------------------------------------------------------------------- | :-----------------------------------: | :--------------------------------------------------------------------------------------------- |
| _Active_ | [:symbols-terminal:&nbsp;SSH](../03_services/ssh.md)                   |                 `22`                  | Provides secure encrypted communications between two untrusted hosts over an insecure network. |
| _Active_ | [:services-syncthing-alt:&nbsp;Syncthing](../03_services/syncthing.md) |     `8384`<br>`22000`<br>`21027`      | Open decentralized file synchronization.                                                       |
| _Active_ | [:services-technitium:&nbsp;Technitium](../03_services/technitium.md)  |        `53`<br>`443`<br>`5380`        | An open-source authoritative as well as recursive DNS server.                                  |

#### :symbols-container:&ensp;Docker Container

|  Status  | Service                                                   | Port(s) { data-sort-method="number" } | Role / Notes { data-sort-method="none" }                                                             |
| :------: | :-------------------------------------------------------- | :-----------------------------------: | :--------------------------------------------------------------------------------------------------- |
| _Active_ | [:services-beszel:&nbsp;Beszel](../03_services/beszel.md) |                `45876`                | Agent for Beszel Hub *(hosted on [Pi 4B Server](pi_4b_server.md#docker-container){ data-preview })*. |
| _Active_ | [:services-dockge:&nbsp;Dockge](../03_services/dockge.md) |                `5001`                 | A fancy, easy-to-use and reactive self-hosted Docker `compose.yaml` stack-oriented manager.          |

---

## :symbols-sticky-notes:&ensp;Maintenance & Notes

!!! config "Critical Configurations"

    -   Do not modify NTP settings or enable `systemd-timesyncd`. It has been replaced with `chrony`.
    -   The VM is configured to boot automatically when the host server boots.

        + If a ZimaOS update breaks this configuration it can be re-applied with the following command on the host machine:

            ``` bash linenums="1"
            sudo virsh autostart <vm_name>
            ```

        + To disable the 'autostart' feature: (not recommended)

            ``` bash linenums="1"
            sudo virsh autostart <vm_name> --disable
            ```

    -   This server has email & push notifications configured for new SSH sessions and `unattended-upgrades`. See [Setup SSH Login Notification](../linux_tutorials/setup_ssh_login_notification.md) for documentation.

#### :symbols-rotate-cw-clock:&ensp;Update Policy

-   The `unattended-upgrades` service is enabled for critical bug fixes and CVE patches to apply automatically.
-   Manual OS updates can be applied with the `apt` package manager. _(Standard Debian)_

    ``` bash linenums="1"
    sudo apt update && sudo apt upgrade
    ```

-   Updates for services using a Docker image can be applied manually with `docker compose` or by using the update utility in [Dockge](../03_services/dockge.md)

!!! warning inline "Warning!"

    + The **KVM / QEMU** hypervisor on ZimaOS only supports external snapshots.
    + To create an external snapshot, run the following command as `root`:

        ``` bash linenums="1"
        virsh snapshot-create-as <vm_name> <snapshot-name> "External snapshot description" --disk-only --atomic
        ```

#### :symbols-fullscreen:&ensp;Snapshot Policy

- Perform external snapshots before major changes.
- The backup of the VDI and snapshots are also backed up to the cloud storage provider, [Backblaze B2](https://www.backblaze.com/cloud-storage){ external-link }, to maintain the [3-2-1 Backup Strategy](../01_infrastructure/disaster_recovery_plan.md#backup-strategy).

#### :symbols-refresh-ccw-dot:&ensp;Recovery

- If the VM is corrupted there are external snapshots to roll back to.
- Also, on the main storage pool on the [ZimaOS NAS](zimaos_nas.md#data){ data-preview } in the `/media/Quick_Storage/Backup/virsh-backups` directory there is a backup disk image and XML settings file.

--8<-- "nerd-fonts.md"

#### :symbols-rocket:&ensp;Starship Terminal Prompt

The Starship terminal prompt is a cross-platform, cross-shell application that replaces the standard shell prompt on your Android, BSD, Windows, Linux, or MacOS computer. It is compatible with Bash, Cmd, Elvish, Fish, Ion, Nutshell, Powershell, Tcsh, Xonsh, and Zsh.

1.  Install the latest version:

    ``` bash linenums="1"
    curl -sS https://starship.rs/install.sh | sh
    ```

2.  Add init script to shell's config file:

    ``` bash linenums="1"
    eval "$(starship init bash)"
    ```

3.  Place the custom config file in the `~/.config` directory:

    ``` toml { .mono-title title="starship.toml" linenums="1" }
    --8<-- "starship-debian-vm.toml"
    ```

#### :symbols-log-in:&ensp;Fastfetch Login Preset

The Fastfetch Login Preset prints a customized Fastfetch output with relevant information every time a new terminal session is started. I have all variants of the preset hosted in a code repository on [GitHub](https://github.com/benhaube/fastfetch-login-preset){ external-link }.

1.  Install Fastfetch:

    ``` bash linenums="1"
    sudo apt update
    sudo apt install fastfetch
    ```

2.  Copy the `login.jsonc` preset file into the presets directory:

    ``` bash linenums="1"
    sudo cp login.jsonc /usr/share/fastfetch/presets
    ```

3.  Add the `fastfetch` command to the `~/.bashrc` file:

    ``` bash linenums="1"
    fastfetch -c login
    ```

##### Fastfetch Preset File

``` json { .mono-title title="/usr/share/fastfetch/presets/login.jsonc" linenums="1" }
--8<-- "fastfetch-login-debian-vm.jsonc"
```

1.  Sets the width of the percentage bars.
2.  **Options:**

    - `1` = number
    - `2` = bar
    - `3` = both
    - `9` = colored number

3.  **Options:**

    - `string`
    - `icon`
    - `both`
    - `none`

4.  Aligns all keys to this uniform width.
5.  Sets the separator symbol used between the keys and values.