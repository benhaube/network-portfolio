---
icon: material/console-network
title: SSH (Secure Shell)
tags:
  - Active
  - Service
  - Software
  - Native
  - Remote Access
  - Shell
  - Infrastructure
hide:
  - toc
---
![Material Design ssh icon](../assets/icons/ssh.svg){ width=300 }

# SSH (Secure Shell)
[Documentation :material-file-document-multiple:](https://www.openssh.org/manual.html){ .md-button .md-button--primary }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ Remote shell access to servers

#### :symbols-settings-ethernet: Port(s):
+ `22`

#### :material-link-variant: URL / Access: 
+ :material-router-wireless:&nbsp;[ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md)
    + `192.168.50.1:22` 
    + `asusrouter.internal:22`
+ :material-debian:&nbsp;[Debian Server VM](../02_Hardware/Debian_Server_VM.md)
    + `192.168.50.6:22` 
    + `debian-vm.internal:22` 
+ :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)
    + `192.168.50.2:22` 
    + `pi-server.internal:22`
+ :material-raspberry-pi:&nbsp;[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md)
    + `192.168.50.3:22` 
    + `pi-zero.internal:22` 
+ :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)
    + `192.168.50.4:22` 
    + `storage-server.internal:22` 
+ :material-printer-3d-nozzle:&nbsp;[Kacey (Creality^&copy;^ K1C) 3D-Printer](../02_Hardware/Kacey_3D-printer.md)
    + `192.168.50.153:22` 
    + `k1c-a71e.internal:22` 

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): SSH keys

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                                                                     | Method                             | Container Name | Image |
| :-------------------------------------------------------------------------------------------------------------- | :--------------------------------- | :------------- | :---- |
| :material-router-wireless:&nbsp;[ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md)                                | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |
| :material-debian:&nbsp;[Debian Server VM](../02_Hardware/Debian_Server_VM.md)                                   | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)                 | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |
| :material-raspberry-pi:&nbsp;[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md)                | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)                                             | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |
| :material-printer-3d-nozzle:&nbsp;[Kacey (Creality^&copy;^ K1C) 3D-Printer](../02_Hardware/Kacey_3D-printer.md) | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |

## :material-cog: Configuration 

### :material-server-outline: Servers:

#### SSH Config File:

1. Make the required changes to the SSH config file: 

    ```nt title="/etc/ssh/sshd_config" linenums="1"
    --8<-- "sshd_config"
    ```

2. Restart the SSH service for the change to take effect:

    ```bash linenums="1"
    sudo systemctl restart sshd
    ```

#### Login Banner:

1. Paste this ASCII message into the banner file:

    ```text title="/etc/issue.net" linenums="1"
    --8<-- "issue.net"
    ```

#### Suppress MOTD:

> [!warning inline end] Warning
> `truncate -s 0` is safer than `> /etc/motd` as it preserves permissions if the file doesn't exist.

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

#### Suppress Last Login: 

1. Open the SSH config file with a text editor:

    ```bash linenums="1"
    sudo nano /etc/ssh/sshd_config
    ```

2. Find the line, `PrintLastLog yes`, and change it to `PrintLastLog no`. 
3. Restart the SSH service for the change to take effect:

    ```bash linenums="1"
    sudo systemctl restart sshd
    ```

> [!important]
> Don't forget to paste the **public key** in a text file for passwordless login:
> 
> ```bash
> nano ~/.ssh/authorized_keys
> ```

> [!zima] Don't Forget!
> **ZimaOS** does not have SSH enabled after a fresh install. For the [[ZimaBoard_2_NAS|ZimaOS NAS]] the SSH service needs to be enabled first through the [ZimaOS Web UI](http://storage-server.internal/) in the developer options.
> + Settings :material-arrow-right-thin: General :material-arrow-right-thin: Developer Mode :material-arrow-right-thin: SSH Access 
>     
>       ![[zimaos_ssh.png|600]]
>         
> + After enabling SSH in the developer options the [[ttydBridge]] application is automatically installed. The SSH service can be configured from there.
> + Once the SSH server is configured the **ttydBridge** application is no longer needed, but remains installed. This is a good backup to get shell access in case of an SSH configuration issue.

> [!help] Email Notification
> The SSH servers on the network have email login notifications configured to notify in the case of unwanted access.<br>
> More information regarding setup and configuration can be found [[Setup_SSH_Login_Email_Notification|here]].

### :material-devices: Clients:

#### Bitwarden SSH Key Agent:

1. Paste this line into the client's `~/.bashrc` file to enable the Bitwarden SSH key agent.

    ```bash linenums="1"
    export SSH_AUTH_SOCK=/home/$USER/.bitwarden-ssh-agent.sock
    ```

#### Client SSH Configuration:

1. Create the `~/.ssh` directory:

    ```bash linenums="1"
    mkdir -p ~/.ssh
    ```

2. Create the config file:

    ```bash linenums="1"
    nano ~/.ssh/config
    ```

3. Paste the following into the config file:

    ```kconfig title="~/.ssh/config" linenums="1"
    --8<-- "ssh-client-config"
    ```

    1. All hosts use Bitwarden SSH key agent
    2. Assume 'admin' is the user for all hosts 
    3. CRITICAL: Prevents offering all other keys stored in Bitwarden

4. Create the `IdentityFile` for all of the servers in the `~/.ssh` directory and paste in the public key.
    + **Example:**

        ```bash linenums="1"
        nano ~/.ssh/[hostname].pub
        ```
