---
icon: symbols/square-terminal
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

![Lucide 'square-terminal' icon](../assets/icons/square-terminal.svg){ width=200 }

# SSH

_Secure Shell_

[Documentation&ensp;:symbols-files:](https://www.openssh.org/manual.html){ .md-button .md-button--primary }

---

![SSH session on ZimaOS-NAS](../assets/screenshots/ssh-zimaos-light.png#only-light){ width=400 align=right }
![SSH session on ZimaOS-NAS](../assets/screenshots/ssh-zimaos-dark.png#only-dark){ width=400 align=right }

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    Provides secure encrypted communications between two untrusted hosts over an insecure network.

#### :symbols-hash:&ensp;Port(s)

:    `22`

#### :symbols-link-2:&ensp;URL / Access

-   :symbols-router:&ensp;ASUS RT-BE92U
{ .no-bullets }
    - `192.168.50.1:22`
    - `asusrouter.internal:22`
-   :symbols-layers:&ensp;Debian Server
{ .no-bullets }
    - `192.168.50.6:22`
    - `debian-vm.internal:22`
-   :symbols-server:&ensp;Pi 4B Server
{ .no-bullets }
    - `192.168.50.2:22`
    - `pi-server.internal:22`
-   :symbols-server:&ensp;Pi Zero 2W Server
{ .no-bullets }
    - `192.168.50.3:22`
    - `pi-zero.internal:22`
-   :symbols-server-nas:&ensp;ZimaOS NAS
{ .no-bullets }
    - `192.168.50.4:22`
    - `192.168.50.5:22`
    - `storage-server.internal:22`
    - `storage-server-2.internal:22`
-   :symbols-printer-3d-nozzle:&ensp;Kacey 3D-Printer
{ .no-bullets }
    - `192.168.50.153:22`
    - `kacey.internal:22`

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }

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

![Bitwarden application settings](../assets/screenshots/bitwarden-ssh-agent-light.png#only-light){ width=350 align=right .on-glb }
![Bitwarden application settings](../assets/screenshots/bitwarden-ssh-agent-dark.png#only-dark){ width=350 align=right .on-glb }

1.  Install the **flatpak** version of the Bitwarden desktop application from [Flathub](https://flathub.org/en/apps/com.bitwarden.desktop "Flathub &mdash; Bitwarden"){ external-link }

    ``` bash linenums="1"
    flatpak install -y com.bitwarden.desktop
    ```

2.  Ensure the package, `libsecret`, is installed. It is required for the Bitwarden desktop app to securely store access tokens and biometric unlock data securely.
3.  Make sure to enable **"Start automatically on login"** and **"Enable SSH agent"** in the Bitwarden application's settings.
4.  Paste this line into the client's `~/.bashrc` file to enable the Bitwarden SSH key agent.

    ``` bash linenums="1"
    export SSH_AUTH_SOCK=/home/$USER/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock
    ```

    ??? note

        :brands-fedora:&ensp;**Fedora PCs**

        :   The PCs running **Fedora &mdash; KDE Plasma Edition** have a separate file for setting environment variables located at `~/.bashrc.d/env`. _DO NOT_ set the `SSH_AUTH_SOCK` environment variable in the `.bashrc` file on these machines.

5.  Once the SSH Agent has been configured for Bitwarden, you may test the setup by requesting an SSH list using the following command:

    ``` bash
    ssh-add -L
    ```

??? tip

    :symbols-moon-star:&ensp;**Dark Theme**

    :   To enable the dark theme for the window decoration and menu bar on the **KDE Plasma Desktop Environment** run the following command to set the `GTK_THEME` environment variable:
        ``` bash
        flatpak override --env=GTK_THEME=Breeze:dark com.bitwarden.desktop  # (1)!
        ```

        1. For other desktop environments and/or themes, replace `Breeze:dark` with the appropriate theme name. _(e.g., for GNOME use `Adwaita-dark`)_

##### Bitwarden Biometrics

![Bitwarden system authentication settings](../assets/screenshots/bitwarden-system-auth-light.png#only-light){ width=350 align=right .on-glb }
![Bitwarden system authentication settings](../assets/screenshots/bitwarden-system-auth-dark.png#only-dark){ width=350 align=right .on-glb }

The flatpak version of the **Bitwarden** desktop client requires a custom policy to be applied with [Polkit](https://en.wikipedia.org/wiki/Polkit "Wikipedia &mdash; Polkit"){ external-link } for system-level authentication integration. To enable unlocking the Bitwarden vault with biometric or system-level authentication follow the following instructions:

1.  Enable **"Unlock with system authentication"** and set **"Timeout Action"** to **"Lock"** in the Bitwarden desktop client's settings.
2.  Download the file, `com.bitwarden.desktop.policy`, from the `bitwarden/clients` code repository on [GitHub](https://github.com/bitwarden/clients/blob/main/apps/desktop/resources/com.bitwarden.desktop.policy "GitHub &mdash; bitwarden/clients"){ external-link }, or copy the code below to create the file.

    ``` xml { .mono-title title="com.bitwarden.desktop.policy" }
    --8<-- "com.bitwarden.desktop.policy"
    ```

3.  Move the policy file to the `/usr/share/polkit-1/actions` directory:

    ``` bash
    sudo mv com.bitwarden.desktop.policy /usr/share/polkit-1/actions
    ```

4.  Set the appropriate permissions for the policy file:

    ``` bash
    sudo chown root:root /usr/share/polkit-1/actions/com.bitwarden.Bitwarden.policy
    sudo chmod 644 /usr/share/polkit-1/actions/com.bitwarden.Bitwarden.policy
    ```

5.  Verify the policy:
    - Polkit automatically monitors the actions directory, so you do not normally need to restart any services for it to detect the new file. You can verify that polkit has successfully registered the new action by running this command:

        ``` bash
        pkaction | grep com.bitwarden
        ```

    - If the command outputs `com.bitwarden.Bitwarden.unlock`, the policy has been successfully added to your system.

        ``` shell-session title="Example Output"
        bhaube @ bens-workstation ~ 
        on Fedora ❯ pkaction | grep com.bitwarden
        com.bitwarden.Bitwarden.unlock
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

    ``` bash title="Example" linenums="1"
    nano ~/.ssh/[hostname].pub
    ```

    ??? failure

        :symbols-user-key:&ensp;**Permissions Warning**

        :   In some cases you may get the following warning when trying to start an SSH session:
            ``` shell-session
            bhaube @ bens-workstation ~
            on Fedora ❯ ssh ASUS-Router
            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
            @         WARNING: UNPROTECTED KEY FILE!          @
            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
            Permissions 0755 for '/home/bhaube/.ssh/asusrouter.pub' are too open.
            It is required that your key files are NOT accessible by others.
            This key will be ignored.
            Load key "/home/bhaube/.ssh/asusrouter.pub": bad permissions
            Admin@asusrouter.internal: Permission denied (publickey).
            ```
        :   If you get this warning; run the following command to secure permissions for the public keys:
            ``` bash
            chmod 600 ~/.ssh/*.pub
            ```