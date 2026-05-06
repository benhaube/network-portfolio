---
icon: services/gotify-notification
status: new
title: Gotify
tags:
  - Active
  - Service
  - Software
  - Docker
  - Monitor
hide:
  - toc
---
![Gotify logo](../assets/icons/gotify-logo.png){ width=200 }

# Gotify
[GitHub :material-github:](https://github.com/gotify/server){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://gotify.net/docs/){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 
+ A simple server for sending and receiving messages in real-time per WebSocket. *(Includes a sleek Web-UI)*
 
#### :symbols-settings-ethernet: Port(s): 
+ `8180`

#### :material-link-variant: URL / Access: 
+ <http://storage-server.internal:8180> &mdash; *Local Network Web-UI only*
+ <https://gotify.rac3r4life.online> &mdash; *Use for notification WebSocket*

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Gotify (admin) @ storage-server"
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Gotify (bhaube) @ storage-server"

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                         | Method                                | Container Name | Image                  |
| :------------------------------------------------------------------ | :------------------------------------ | :------------- | :--------------------- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `gotify`       | `gotify/server:latest` |

### :material-cog: Configuration 

```yaml title="compose.yml" linenums="1"
--8<-- "gotify.yml"
```

1. Sets your initial `admin` password. Change the `admin` password after first login.

#### :material-application-cog: Configured Applications:

| Application                                                              | Host Device                                                                                      | Role / Notes                                                                                                                     |
| :----------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------- |
| :services-beszel:&nbsp;[Beszel Hub](../03_Services/Beszel_Hub.md)        | :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)  | Recieve notifications when servers have a hardware failure and/or reach or exceed set thresholds for temperature, load avg, etc. |
| :services-uptime-kuma:&nbsp;[Uptime Kuma](../03_Services/Uptime_Kuma.md) | :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)  | Recieve notifications when services / infrastructure monitored by Uptime Kuma report a down status or other issue.               |
| :material-console-network:&nbsp;[SSH](../03_Services/SSH.md)             | :material-router-wireless:&nbsp;[ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md)                 | Recieve notifications when a new SSH session is successfully established. Reports the user, hostname, and cliet IP address.      |
|                                                                          | :material-debian:&nbsp;[Debian Server VM](../02_Hardware/Debian_Server_VM.md)                    |                                                                                                                                  |
|                                                                          | :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)  |                                                                                                                                  |
|                                                                          | :material-raspberry-pi:&nbsp;[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md) |                                                                                                                                  |
|                                                                          | :services-zimaos:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)                           |                                                                                                                                  |

#### :material-console-network: SSH Notification Script:

1. Create the script file: 

    ```bash title="Debian Servers&emsp;<code>/usr/local/bin/</code>" linenums="1"
    sudo nano /usr/local/bin/gotify-ssh-alert.sh
    ```

    ```bash title="ZimaOS NAS&emsp;<code>/opt/bin/</code>" linenums="1"
    sudo nano /opt/bin/gotify-ssh-alert.sh  # (1)!
    ```

    1. Since **ZimaOS** is an immutable operating system, it is necessary to use the `/opt/bin/` directory. This ensures the script is not deleted after OS upgrades and / or system reboots.

    ```sh title="ASUS Router&emsp;<code>/jffs/scripts/</code>" linenums="1"
    nano /jffs/scripts/gotify-ssh-alert.sh  # (1)!
    ```

    1. **Asuswrt-Merlin** uses an embedded Linux environment *(BusyBox)* and relies on a lightweight SSH server called **Dropbear** instead of **OpenSSH**. Because of this, it does not use Pluggable Authentication Modules (PAM) at all.<br><br>Furthermore, the base filesystem on the router is read-only or wiped on reboot, so any changes made outside of the designated `/jffs/` partition are lost when the router restarts.<br><br>**Asuswrt-Merlin** has a built-in feature for custom scripting via the `JFFS` partition. Instead of a PAM trigger, we can use the router's profile configuration to fire the script off whenever an interactive shell session is spawned.

2. Paste the following code into the `nano` text editor:

    ```bash title="Linux Servers" linenums="1" hl_lines="9 10"
    --8<-- "gotify-ssh-alert.sh"
    ```

    1. Only trigger the alert when a session is opened, ignoring logouts or credential checks.
    2. Replace the `TOKEN` and `URL` variables with your actual Gotify App token and URL.
    3. Send the `POST` request to Gotify.

    ```sh title="ASUS Router" linenums="1" hl_lines="8 9"
    --8<-- "gotify-ssh-alert-router.sh"
    ```

    1. Only proceed if the session was initiated via SSH.
    2. Extract the client IP from the `SSH_CONNECTION` variable.
    3. Replace the `TOKEN` and `URL` variables with your actual Gotify App token and URL.
    4. Send the `POST` request to Gotify.

3. Set restrictive permissions, allow execution, and ensure `root` ownership of the `gotify-ssh-alert.sh` file:

    ```bash title="Debian Servers" linenums="1"
    sudo chmod 700 /usr/local/bin/gotify-ssh-alert.sh
    sudo chown root:root /usr/local/bin/gotify-ssh-alert.sh
    ```

    ```bash title="ZimaOS NAS" linenums="1"
    sudo chmod 700 /opt/bin/gotify-ssh-alert.sh
    sudo chown root:root /opt/bin/gotify-ssh-alert.sh
    ```

    ```sh title="ASUS Router" linenums="1"
    chmod +x /jffs/scripts/gotify-ssh-alert.sh  # (1)!
    ```

    1. Setting `root` ownership is not necessary for the ASUS router because the only available SSH user with the **Asuswrt-Merlin** firmware is the `root` user.

4. Edit the respective configuration files:

    ```bash title="Debian Servers&emsp;<code>/etc/pam.d/sshd</code>" linenums="1"
    session     optional     pam_exec.so     /usr/local/bin/gotify-ssh-alert.sh  # (1)!
    ```
      
    1. Add line to `/etc/pam.d/sshd` after the existing "session" lines.

    ```bash title="ZimaOS NAS&emsp;<code>/etc/pam.d/sshd</code>" linenums="1"
    session     optional     /lib/security/pam_exec.so     /opt/bin/gotify-ssh-alert.sh  # (1)!
    ```

    2. Add line to `/etc/pam.d/sshd` after the existing "session" lines.    

    ```sh title="ASUS Router&emsp;<code>/jffs/configs/profile.add</code>" linenums="1"
    /jffs/scripts/gotify-ssh-alert.sh &  # (1)!
    ```

    3. Add this single line to the bottom of the file.<br><br>**Note:** The `&` symbol at the end is crucial. It runs the script in the background so it doesn't hang or delay your SSH login prompt while it waits for the `curl` command to reach the Gotify server.
