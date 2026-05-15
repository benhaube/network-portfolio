---
icon: services/gotify-notification
status: new
title: Gotify
subtitle: Push Notifications
description: A simple server for sending and receiving messages in real-time per WebSocket.
tags:
  - Active
  - Service
  - Software
  - Docker
  - Monitor
  - New
hide:
  - toc
---
![Gotify logo](../assets/icons/gotify-logo.png){ width=200 }

# Gotify
*Push Notifications*

[GitHub :material-github:](https://github.com/gotify/server){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://gotify.net/docs/){ .md-button .md-button--primary }

---
## :material-information-outline: Overview

#### :symbols-description: Description: 

:    A simple server for sending and receiving messages in real-time per WebSocket. *(Includes a sleek Web-UI)*
 
#### :symbols-settings-ethernet: Port(s): 

+ `8180`

#### :material-link-variant: URL / Access: 

+ <http://storage-server.internal:8180> &mdash; *Local Network Web-UI only*
+ <https://gotify.rac3r4life.online> &mdash; *Use for notification WebSocket*

#### :material-key-chain: Credentials: 

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Gotify (admin)"
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"Gotify (bhaube)"

#### :material-message-alert: Notifications:

| Application&emsp;:material-information-outline:{ title="Click on the links in this column to jump to the corresponding section on this page." } | Role / Notes                                                                                                                          |
| :---------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------ |
| :services-beszel:&nbsp;[Beszel Alerts](#beszel-alerts)                                                                                          | Receive push notifications when servers have a hardware failure and/or reach or exceed set thresholds for temperature, load avg, etc. |
| :services-uptime-kuma:&nbsp;[Uptime Kuma Alerts](#uptime-kuma-alerts)                                                                           | Receive push notifications when services / infrastructure monitored by Uptime Kuma report a down status or other issue.               |
| :material-console-network:&nbsp;[SSH Alerts](#ssh-alerts)                                                                                       | Receive push notifications when a new SSH session is successfully established. Reports the user, hostname, and cliet IP address.      |
| :material-router-wireless:&nbsp;[Router Alerts](#router-alerts)                                                                                 | Receive push notifications from the **ASUS RT-BE92U** wireless router on WAN IP changes, automated backups, and `connmon` events.     |
| :material-cloud-upload-outline:&nbsp;[Backup Alerts](#backup-alerts)                                                                            | Receive push notifications when the `home-bkp-nas.sh` script runs on my Linux PCs.                                                    |
| :services-homebox:&nbsp;[Homebox Alerts](#homebox-alerts)                                                                                       | Receive push notifications for upcoming maintenance reminders.                                                                        |

## :symbols-deployed-code-update: Deployment Details

| Host Device                                                         | Method                                | Container Name | Image                  |
| :------------------------------------------------------------------ | :------------------------------------ | :------------- | :--------------------- |
| :material-nas:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-docker:&nbsp;Docker Compose | `gotify`       | `gotify/server:latest` |

### :material-cog: Configuration 

#### :material-docker: Docker Compose:

```yaml title="<code>compose.yml</code>" linenums="1"
--8<-- "gotify.yml"
```

1. Sets your initial `admin` password. Change the `admin` password after first login.

#### :services-beszel: Beszel Alerts:

1. Open the [Beszel Hub](../03_Services/Beszel_Hub.md) settings menu, go to the **"Notifications"** sub-menu, and enter the following URL into the **"Webhook / Push Notifications"** section.
   
    ```text linenums="1"
    gotify://gotify.rac3r4life.online/<YourAppToken>
    ```

2. Click the **"Test URL"** button to send a test notification and verify functionality.

#### :services-uptime-kuma: Uptime Kuma Alerts:

![Uptime Kuma "Add Notification" Settings](../assets/screenshots/gotify-uptime-kuma-light.png#only-light){ width=325 align=right }
![Uptime Kuma "Add Notification" Settings](../assets/screenshots/gotify-uptime-kuma-dark.png#only-dark){ width=325 align=right }

1. Open the [Uptime Kuma](../03_Services/Uptime_Kuma.md) settings menu, and enter the **"Notifications"** sub-menu.
2. Click the **"Set Up Notification"** button.
3. In the **"Notification Type"** drop-down menu, select the option **"Gotify"**.
4. Give your new notification a name in the **"Friendly Name"** field.
5. Enter your unique app token in the **"Application Token"** field.
6. Enter your Gotify server address in the **"Server URL"** field.

    ```text linenums="1"
    https://gotify.rac3r4life.online
    ```

7. Set your desired notification priority in the **"Priority"** field.
8. Click the **"Test"** button before saving to confirm your settings are functional.
9. *Optional:*
    + Toggle **"Default enabled"** if you want your notification to be enabled for all new monitors.
    + Toggle **"Apply on all existing monitors"** to apply your new notification to your existing monitors. 

#### :material-console-network: SSH Alerts:

1. Create the script: 

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

#### :material-router-wireless: Router Alerts:

##### WAN IP Change

1. Create the custom script:

    ```sh linenums="1"
    nano /jffs/scripts/ddns-start
    ```

2. Paste this code into the file, then save and close.

    ```sh title="<code>/jffs/scripts/ddns-start</code>" linenums="1" hl_lines="4 5"
    --8<-- "ddns-start.sh"
    ```

    1. Replace the `TOKEN` and `URL` variables with your actual Gotify App token and URL.
    2. `$1` is the new IP passed by the router.

3. Make the script executable:

    ```sh linenums="1"
    chmod +x /jffs/scripts/ddns-start
    ```

##### BACKUPMON Alerts

1. Create the custom wrapper script:

    ```sh linenums="1"
    nano /jffs/scripts/gotify-backupmon.sh
    ```

2. Paste this code into the file, then save and close.

    ```sh title="<code>/jffs/scripts/gotify-backupmon.sh</code>" linenums="1" hl_lines="4 5"
    --8<-- "gotify-backupmon.sh"
    ```

    1. Replace the `TOKEN` and `URL` variables with your actual Gotify App token and URL.
    2. Execute `backupmon` silently.
    3. Check the exit status of the backup script, and send the appropriate notification.

3. Make the script executable:

    ```sh linenums="1"
    chmod +x /jffs/scripts/gotify-backupmon.sh
    ```

4. Open the `crontab` editor, and replace the existing `backupmon` script with your custom wrapper script.

    ```sh linenums="1"
    crontab -e
    ```

    ```sh linenums="1"
    30 2 * * * sh /jffs/scripts/gotify-backupmon.sh #RunBackupMon#
    ```

##### Connmon Alerts

1. Create the script: 

    ```sh linenums="1"
    nano /opt/share/connmon.d/userscripts.d/gotify-connmon.sh
    ```

2. Paste this code into the file, then save and close.

    ```sh title="<code>/opt/share/connmon.d/userscripts.d/gotify-connmon.sh</code>" linenums="1" hl_lines="4 5"
    --8<-- "gotify-connmon.sh"
    ```

    1. Replace the `TOKEN` and `URL` variables with your actual Gotify App token and URL.
    2. Default title and priority.
    3. Catch-all for any undefined triggers.
    4. Send the `POST` request to Gotify.

3. Make the script executable:

    ```sh linenums="1"
    chmod +x /opt/share/connmon.d/userscripts.d/gotify-connmon.sh
    ```

4. Once saved and executable, `connmon` will automatically detect the script in the directory. You will just need to enter the `connmon` notifications menu and enable the custom user scripts option. The next time a ping threshold is breached or the connection drops entirely, conmon will fire this script, format the variables into a clean string, and push it directly to the Gotify server.

#### :material-cloud-upload-outline: Backup Alerts

1. Ensure the Gotify notification code is included at the bottom of the script, `home-bkp-nas.sh`. 

    ```bash title="<code>home-bkp-nas.sh</code>" linenums="1" hl_lines="3 4"
    --8<-- "home-bkp-nas.sh:59"
    ```

    1. Placeholder
    2. Replace the `GOTIFY_TOKEN` and `GOTIFY_URL` variables with your actual Gotify App token and URL.

2. That is all the extra configuration needed. Now, every time the backup script runs a notification will be sent to the Gotify server showing the success or failure of the backup. 

#### :services-homebox: Homebox Alerts

![Homebox notification settings screenshot](../assets/screenshots/homebox-notify-light.png#only-light){ width=325 align=right }
![Homebox notification settings screenshot](../assets/screenshots/homebox-notify-dark.png#only-dark){ width=325 align=right }

1. Log into the Homebox Web application.
2. Click the arrow to expand the "Collections" menu on the left side-bar, then click "Notifiers."
3. Click the "Create" button.
4. Fill out the name and URL fields. 

    **URL Format:**

    ```text linenums="1"
    gotify://gotify.rac3r4life.online/<YourAppToken>
    ```

5. Click the "Test" button to send a test notification.
6. Click "Submit" to save the new notification.