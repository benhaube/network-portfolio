---
icon: symbols/terminal
title: SSH
subtitle: Secure Shell
description: Provides secure encrypted communications between two untrusted hosts over an insecure network.
tags:
  - Active
  - Native
  - Remote Access
  - Shell
  - Infrastructure
hide:
  - toc
---
![Material Design ssh icon](../assets/icons/console.svg){ width=200 }

# SSH
*Secure Shell*

[Documentation&ensp;:symbols-documentation:](https://www.openssh.org/manual.html){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    Provides secure encrypted communications between two untrusted hosts over an insecure network.

#### :symbols-settings-ethernet:&ensp;Port(s)

+ `22`

#### :symbols-link:&ensp;URL / Access 

+ :symbols-router-outline:&nbsp;ASUS RT-BE92U
    + `192.168.50.1:22` 
    + `asusrouter.internal:22`
+ :symbols-server-outline:&nbsp;Debian Server
    + `192.168.50.6:22` 
    + `debian-vm.internal:22` 
+ :symbols-server-outline:&nbsp;Raspberry Pi 4B Server
    + `192.168.50.2:22` 
    + `pi-server.internal:22`
+ :symbols-server-outline:&nbsp;Raspberry Pi Zero Server
    + `192.168.50.3:22` 
    + `pi-zero.internal:22` 
+ :symbols-nas-outline:&nbsp;ZimaOS NAS
    + `192.168.50.4:22`
    + `192.168.50.5:22` 
    + `storage-server.internal:22` 
    + `storage-server-2.internal:22`
+ :brands-creality-v2:&nbsp;Kacey 3D-Printer
    + `192.168.50.153:22` 
    + `kacey.internal:22` 

#### :symbols-key:&ensp;Credentials 

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + SSH keys&ensp;:symbols-arrow-right-thin:&ensp;"ASUS RT-BE92U (Admin)"
    + SSH keys&ensp;:symbols-arrow-right-thin:&ensp;"debian-vm (server-admin)"
    + SSH keys&ensp;:symbols-arrow-right-thin:&ensp;"pi-server (admin)"
    + SSH keys&ensp;:symbols-arrow-right-thin:&ensp;"pi-zero (admin)"
    + SSH keys&ensp;:symbols-arrow-right-thin:&ensp;"ZimaOS NAS (admin)"
    + SSH keys&ensp;:symbols-arrow-right-thin:&ensp;"Kacey (root)"

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                                                       | Method                            | Container Name | Image |
| :------------------------------------------------------------------------------------------------ | :-------------------------------- | :------------- | :---- |
| [:symbols-router-outline:&nbsp;ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md)                    | :symbols-linux:&nbsp;Native Linux | `N/A`          | `N/A` |
| [:symbols-server-outline:&nbsp;Debian Server](../02_Hardware/Debian_Server_VM.md)                 | :symbols-linux:&nbsp;Native Linux | `N/A`          | `N/A` |
| [:symbols-server-outline:&nbsp;Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)  | :symbols-linux:&nbsp;Native Linux | `N/A`          | `N/A` |
| [:symbols-server-outline:&nbsp;Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md) | :symbols-linux:&nbsp;Native Linux | `N/A`          | `N/A` |
| [:symbols-nas-outline:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)                                | :symbols-linux:&nbsp;Native Linux | `N/A`          | `N/A` |
| [:brands-creality-v2:&nbsp;Kacey 3D-Printer](../02_Hardware/Kacey_3D-printer.md)                  | :symbols-linux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration 

#### :symbols-server-outline:&ensp;Servers

!!! tip 

    **New Session Notification:**
    :    The SSH servers on the local network have **email & push** notifications configured to notify in case of unwanted access.<br>

        [SSH Login Notification&ensp;:symbols-feedback-outline:](../Linux_Tutorials/Setup_SSH_Login_Email_Notification.md){ .md-button }

##### SSH Config File

1. Make the required changes to the SSH config file: 

    ```nt {title="/etc/ssh/sshd_config" linenums="1" .mono-title}
    --8<-- "sshd_config"
    ```

2. Restart the SSH service for the change to take effect:

    ```bash linenums="1"
    sudo systemctl restart sshd
    ```

##### Login Banner

1. Paste this ASCII message into the banner file:

    ```text {title="/etc/issue.net" linenums="1" .mono-title}
    --8<-- "issue.net"
    ```

##### Suppress MOTD

!!! warning inline end 

    `truncate -s 0` is safer than `> /etc/motd` as it preserves permissions if the file doesn't exist.

1. Run this command to clear MOTD file:

    ```bash linenums="1"
    sudo truncate -s 0 /etc/motd
    ```

2. See what dynamic MOTD scripts exist:

    ```bash linenums="1"
    ls -l /etc/update-motd.d/
    ```

3. Remove executable permission for unwanted scripts:

    ```bash linenums="1"
    sudo chmod -x /etc/update-motd.d/SCRIPT_TO_REMOVE
    ```

4. To re-enable a script give it execute permission again:

    ```bash linenums="1"
    sudo chmod +x /etc/update-motd.d/SCRIPT_TO_ENABLE
    ```

##### Suppress Last Login

1. Open the SSH config file with a text editor:

    ```bash linenums="1"
    sudo nano /etc/ssh/sshd_config
    ```

2. Find the line, `PrintLastLog yes`, and change it to `PrintLastLog no`. 
3. Restart the SSH service for the change to take effect:

    ```bash linenums="1"
    sudo systemctl restart sshd
    ```

!!! danger "Important"

    Don't forget to paste the **public key** in a text file for passwordless login:
 
    ```bash
    nano ~/.ssh/authorized_keys
    ```

--8<-- "zima-ssh.md"

#### :symbols-devices:&ensp;Clients

##### Bitwarden SSH Key Agent

![Bitwarden application settings](../assets/screenshots/bitwarden-ssh-agent.png){ width=350 align=right }

1. Download the appropriate version of the Bitwarden desktop application from the [GitHub Releases](https://github.com/bitwarden/clients/releases) page.
2. Install the package: 

    ```bash title="Fedora / RHEL" linenums="1"
    sudo rpm -i <package-name.rpm>
    ```

    ```bash title="Debian" linenums="1"
    sudo dpkg -i <package-name.deb>
    ```

3. Make sure to enable **"Start automatically on login"** and **"Enable SSH agent"** in the Bitwarden application's settings. 
4. Paste this line into the client's `~/.bashrc` file to enable the Bitwarden SSH key agent.

    ```bash linenums="1"
    export SSH_AUTH_SOCK=/home/$USER/.bitwarden-ssh-agent.sock
    ```

##### SSH Config File

1. Create the `~/.ssh` directory:

    ```bash linenums="1"
    mkdir -p ~/.ssh
    ```

2. Create the config file:

    ```bash linenums="1"
    nano ~/.ssh/config
    ```

3. Paste the following into the config file:

    ```kconfig {title="~/.ssh/config" linenums="1" .mono-title}
    --8<-- "ssh-client-config"
    ```

    1. All hosts use Bitwarden SSH key agent
    2. Assume 'admin' is the user for all hosts 
    3.    :symbols-warning:&nbsp;**CRITICAL:** 
          
          Prevents offering all other keys stored in Bitwarden

4. Create the `IdentityFile` for all of the servers in the `~/.ssh` directory and paste in the public key.
    + **Example:**

        ```bash linenums="1"
        nano ~/.ssh/[hostname].pub
        ```
