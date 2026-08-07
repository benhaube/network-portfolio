---
icon: symbols/terminal
title: SSH
subtitle: Secure Shell
description: Provides secure encrypted communications between two untrusted hosts over an insecure network.
tags:
  - Active
  - Infrastructure
  - Native
  - Remote Access
  - Service
  - Shell
hide:
  - toc
---

![Material Design ssh icon](../assets/icons/terminal.svg){ width=200 }

# SSH

_Secure Shell_

[Documentation&ensp;:symbols-files:](https://www.openssh.org/manual.html){ .md-button .md-button--primary }

---

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    Provides secure encrypted communications between two untrusted hosts over an insecure network.

#### :symbols-hash:&ensp;Port(s)

:    `22`

#### :symbols-link-2:&ensp;URL / Access  

:    :symbols-router:&nbsp;ASUS RT-BE92U

    - `192.168.50.1:22`
      - `asusrouter.internal:22`

:    :symbols-layers:&nbsp;Debian Server

    - `192.168.50.6:22`
      - `debian-vm.internal:22`

:    :symbols-server:&nbsp;Pi 4B Server

    - `192.168.50.2:22`
      - `pi-server.internal:22`

:    :symbols-server:&nbsp;Pi Zero 2W Server

    - `192.168.50.3:22`
      - `pi-zero.internal:22`

:    :symbols-server-nas:&nbsp;ZimaOS NAS

    - `192.168.50.4:22`
      - `192.168.50.5:22`
      - `storage-server.internal:22`
      - `storage-server-2.internal:22`

:    :symbols-printer-3d-nozzle:&nbsp;Kacey 3D-Printer

    - `192.168.50.153:22`
      - `kacey.internal:22`

#### :symbols-user-key:&ensp;Credentials 

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }:

    - SSH keys&ensp;:symbols-move-right:&ensp;"ASUS RT-BE92U (Admin)"
      - SSH keys&ensp;:symbols-move-right:&ensp;"debian-vm (server-admin)"
      - SSH keys&ensp;:symbols-move-right:&ensp;"pi-server (admin)"
      - SSH keys&ensp;:symbols-move-right:&ensp;"pi-zero (admin)"
      - SSH keys&ensp;:symbols-move-right:&ensp;"ZimaOS NAS (admin)"
      - SSH keys&ensp;:symbols-move-right:&ensp;"Kacey (root)"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                                             | Method                          | Container Name | Image |
| :-------------------------------------------------------------------------------------- | :------------------------------ | :------------- | :---- |
| [:symbols-router:&nbsp;ASUS RT-BE92U](../02_hardware/asus_rt-be92u.md)                  | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` |
| [:symbols-layers:&nbsp;Debian Server](../02_hardware/debian_server.md)                  | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md)                    | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` |
| [:symbols-server:&nbsp;Pi Zero 2W Server](../02_hardware/pi_zero_2w_server.md)          | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md)                    | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` |
| [:symbols-printer-3d-nozzle:&nbsp;Kacey 3D-Printer](../02_hardware/kacey_3d-printer.md) | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration

#### :symbols-server:&ensp;Servers

!!! tip 

    **New Session Notification:**
    :    The SSH servers on the local network have **email & push** notifications configured to notify in case of unwanted access.<br>

        [SSH Login Notification&ensp;:symbols-message-square-warning:](../linux_tutorials/setup_ssh_login_notification.md){ .md-button }

##### SSH Config File

1.  Make the required changes to the SSH config file:

    ``` nt { .mono-title title="/etc/ssh/sshd_config" linenums="1" }
    --8<-- "sshd_config"
    ```

2.  Restart the SSH service for the change to take effect:

    ``` bash linenums="1"
    sudo systemctl restart sshd
    ```

##### Login Banner

1.  Paste this ASCII message into the banner file:

    ``` text { .mono-title title="/etc/issue.net" linenums="1" }
    --8<-- "issue.net"
    ```

##### Suppress MOTD

!!! warning inline end 

    `truncate -s 0` is safer than `> /etc/motd` as it preserves permissions if the file doesn't exist.

1.  Run this command to clear MOTD file:

    ``` bash linenums="1"
    sudo truncate -s 0 /etc/motd
    ```

2.  See what dynamic MOTD scripts exist:

    ``` bash linenums="1"
    ls -l /etc/update-motd.d/
    ```

3.  Remove executable permission for unwanted scripts:

    ``` bash linenums="1"
    sudo chmod -x /etc/update-motd.d/SCRIPT_TO_REMOVE
    ```

4.  To re-enable a script give it execute permission again:

    ``` bash linenums="1"
    sudo chmod +x /etc/update-motd.d/SCRIPT_TO_ENABLE
    ```

##### Suppress Last Login

1.  Open the SSH config file with a text editor:

    ``` bash linenums="1"
    sudo nano /etc/ssh/sshd_config
    ```

2.  Find the line, `PrintLastLog yes`, and change it to `PrintLastLog no`.
3.  Restart the SSH service for the change to take effect:

    ``` bash linenums="1"
    sudo systemctl restart sshd
    ```

!!! danger "Important"

    Don't forget to paste the **public key** in a text file for passwordless login:

    ``` bash
    nano ~/.ssh/authorized_keys
    ```

--8<-- "zima-ssh.md"

#### :symbols-monitor-smartphone:&ensp;Clients

##### Bitwarden SSH Key Agent

![Bitwarden application settings](../assets/screenshots/bitwarden-ssh-agent-light.png#only-light){ width=350 align=right }
![Bitwarden application settings](../assets/screenshots/bitwarden-ssh-agent-dark.png#only-dark){ width=350 align=right }

1.  Download the appropriate version of the Bitwarden desktop application from the [GitHub Releases](https://github.com/bitwarden/clients/releases) page.
2.  Install the package:

    ``` bash title="Fedora / RHEL" linenums="1"
    sudo rpm -i <package-name.rpm>
    ```

    ``` bash title="Debian" linenums="1"
    sudo dpkg -i <package-name.deb>
    ```

3.  Make sure to enable **"Start automatically on login"** and **"Enable SSH agent"** in the Bitwarden application's settings.
4.  Paste this line into the client's `~/.bashrc` file to enable the Bitwarden SSH key agent.

    ``` bash linenums="1"
    export SSH_AUTH_SOCK=/home/$USER/.bitwarden-ssh-agent.sock
    ```

##### SSH Config File

1.  Create the `~/.ssh` directory:

    ``` bash linenums="1"
    mkdir -p ~/.ssh
    ```

2.  Create the config file:

    ``` bash linenums="1"
    nano ~/.ssh/config
    ```

3.  Paste the following into the config file:

    ``` kconfig { .mono-title title="~/.ssh/config" linenums="1" }
    --8<-- "ssh-client-config"
    ```

    1.  All hosts use Bitwarden SSH key agent
    2.  Assume 'admin' is the user for all hosts
    3.  :symbols-triangle-alert:&nbsp;**CRITICAL:**

        Prevents offering all other keys stored in Bitwarden

4.  Create the `IdentityFile` for all of the servers in the `~/.ssh` directory and paste in the public key.
    + **Example:**

        ``` bash linenums="1"
        nano ~/.ssh/[hostname].pub
        ```
