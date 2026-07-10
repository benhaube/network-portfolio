---
icon: services/gotify-notification
status: new
title: Gotify
subtitle: Push Notifications
description: A simple server for sending and receiving messages in real-time per WebSocket.
tags:
  - Active
  - Docker
  - Monitor
  - New
  - Service
hide:
  - toc
---
![Gotify logo](../assets/icons/gotify-logo.svg){ width=200 }

# Gotify
*Push Notifications*

[GitHub&ensp;:brands-github:](https://github.com/gotify/server){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation-outline:](https://gotify.net/docs/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    A simple server for sending and receiving messages in real-time per WebSocket. *(Includes a sleek Web-UI)*
 
#### :symbols-settings-ethernet:&ensp;Port(s) 

+ `8180`

#### :symbols-link-alt:&ensp;URL / Access

+ <http://storage-server.internal:8180> &mdash; *Local Network Web-UI only*
+ <http://storage-server-2.internal:8180> &mdash; *Local Network Web-UI only*
+ <https://gotify.rac3r4life.online> &mdash; *Use for notification WebSocket*

#### :symbols-user-key:&ensp;Credentials 

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Gotify (admin)"
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Gotify (bhaube)"

#### :symbols-message-square-warning:&ensp;Notifications

| Application&emsp;:symbols-info:{ title="Click on the links in this column to jump to the corresponding section on this page." } | Role / Notes                                                                                                                                         |
| :------------------------------------------------------------------------------------------------------------------------------ | :--------------------------------------------------------------------------------------------------------------------------------------------------- |
| [:symbols-backup:&nbsp;Backup Alerts](#backup-alerts)                                                                           | Receive push notifications when the `home-bkp-nas.sh` script runs on my Linux PCs.                                                                   |
| [:services-beszel:&nbsp;Beszel Alerts](#beszel-alerts)                                                                          | Receive push notifications when servers have a hardware failure and/or reach or exceed set thresholds for temperature, load avg, etc.                |
| [:services-homebox:&nbsp;Homebox Alerts](#homebox-alerts)                                                                       | Receive push notifications for upcoming maintenance reminders.                                                                                       |
| [:symbols-router-outline:&nbsp;Router Alerts](#router-alerts)                                                                   | Receive push notifications from the **ASUS RT-BE92U** wireless router on WAN IP changes, automated backups, `connmon` events, and DHCP `add` events. |
| [:symbols-terminal-alt:&nbsp;SSH Alerts](#ssh-alerts)                                                                           | Receive push notifications when a new SSH session is successfully established. Reports the user, hostname, and client IP address.                    |
| [:services-uptime-kuma:&nbsp;Uptime Kuma Alerts](#uptime-kuma-alerts)                                                           | Receive push notifications when services / infrastructure monitored by Uptime Kuma report a down status or other issue.                              |
| [:services-zimaos:&nbsp;ZimaOS Alerts](#zimaos-alerts)                                                                          | Receive push notifications when automated maintenance tasks and cron jobs are completed on the ZimaOS NAS.                                           |

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                               | Method                                | Container Name | Image                  |
| :------------------------------------------------------------------------ | :------------------------------------ | :------------- | :--------------------- |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :services-docker:&nbsp;Docker Compose | `gotify`       | `gotify/server:latest` |

### :symbols-settings:&ensp;Configuration 

#### :services-docker:&ensp;Docker Compose

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "gotify.yml"
```

1. Sets your initial `admin` password. Change the `admin` password after first login.

#### :symbols-backup:&ensp;Backup Alerts

1. Ensure the Gotify notification code is included at the bottom of the script, `home-bkp-nas.sh`. 

    ```bash {title="home-bkp-nas.sh" linenums="1" hl_lines="3 4" .mono-title}
    --8<-- "home-bkp-nas.sh:59"
    ```

    1. Placeholder
    2. Replace the `GOTIFY_TOKEN` and `GOTIFY_URL` variables with your actual Gotify App token and URL.

2. That is all the extra configuration needed. Now, every time the backup script runs a notification will be sent to the Gotify server showing the success or failure of the backup. 

#### :services-beszel:&ensp;Beszel Alerts

1. Open the [Beszel Hub](../03_Services/Beszel_Hub.md) settings menu, go to the **"Notifications"** sub-menu, and enter the following URL into the **"Webhook / Push Notifications"** section.
   
    ```text linenums="1"
    gotify://gotify.rac3r4life.online/<YourAppToken>
    ```

2. Click the **"Test URL"** button to send a test notification and verify functionality.

#### :services-homebox:&ensp;Homebox Alerts

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

#### :symbols-router-outline:&ensp;Router Alerts

##### WAN IP Change

!!! note inline end
    
    The `ddns-start` script also contains the code to update the [DDNS](./DDNS.md) service. 

1. Create the custom script:

    ```sh linenums="1"
    nano /jffs/scripts/ddns-start
    ```

2. Paste this code into the file, then save and close.

    ```sh {title="/jffs/scripts/ddns-start" linenums="1" hl_lines="5 13 14" .mono-title}
    --8<-- "ddns-start.sh"
    ```

    1. Replace the `TOKEN` and `URL` variables with your actual Gotify App token and URL.
    2. `$1` is the new IP passed by the router.
    3.    Replace the `KEY` variable with the key provided by addr.tools for your domain name. The Key is stored in the Bitwarden vault.
          
          [:services-bitwarden:&ensp;**Bitwarden:**](https://vault.bitwarden.com)

          + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"DDNS Key (myaddr.tools)"

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

    ```sh {title="/jffs/scripts/gotify-backupmon.sh" linenums="1" hl_lines="4 5" .mono-title}
    --8<-- "gotify-backupmon.sh"
    ```

    1. Replace the `TOKEN` and `URL` variables with your actual Gotify App token and URL.
    2. Execute `backupmon` silently.
    3. Check the exit status of the backup script, and send the appropriate notification.

3. Make the script executable:

    ```sh linenums="1"
    chmod +x /jffs/scripts/gotify-backupmon.sh
    ```

4. Edit the `services-start` script to add the custom wrapper script to the `crontab` after every reboot.

    + Open the script in the `nano` text editor:
  
        ```sh linenums="1"
        nano /jffs/scripts/services-start
        ```

    + Append the following code to the bottom of the script:

        ```sh {title="/jffs/scripts/services-start" linenums="1" .mono-title}
        # (1)!
        (
            sleep 15
            cru a RunBackupMonGotify "30 2 * * 0 sh /jffs/scripts/gotify-backupmon.sh"
        ) &
        ```

        1. Append your custom cron job safely in the background.

        !!! tip

            Make sure the option, **"Schedule Backups"**, is disabled in the BACKUPMON settings to avoid conflicting / duplicate cron jobs in the `crontab`. With this setting enabled, the `crontab` will contain a line to run the BACKUPMON script on its own *(outside the Gotify wrapper script)*.

5. Verify the `services-start` script is working, and adding the custom cron job properly.

    !!! note inline end

        You should see your job ID and schedule listed in the output. Now, when the router reboots, it will automatically rerun `services-start` and handle the manual entry for you.

    + Run the `services-start` script manually:
  
        ```sh linenums="1"
        /jffs/scripts/services-start
        ```

    + Verify your cron job was successfully added to the `crontab`:

        ```sh linenums="1"
        cru l
        ```

##### Connmon Alerts

1. Create the script: 

    ```sh linenums="1"
    nano /opt/share/connmon.d/userscripts.d/gotify-connmon.sh
    ```

2. Paste this code into the file, then save and close.

    ```sh {title="/opt/share/connmon.d/userscripts.d/gotify-connmon.sh" linenums="1" hl_lines="4 5" .mono-title}
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

4. Once saved and executable, `connmon` will automatically detect the script in the directory. You will just need to enter the `connmon` notifications menu and enable the custom user scripts option. The next time a ping threshold is breached or the connection drops entirely, connmon will fire this script, format the variables into a clean string, and push it directly to the Gotify server.

##### DHCP Event Alerts

1. Verify the default script `dnsmasq` is currently using for its DHCP script:

    ```sh linenums="1"
    cat /etc/dnsmasq.conf | grep dhcp-script
    ```

    !!! note

        It should return `dhcp-script=/sbin/dhcpc_lease`. If you are running add-ons that have already modified this, note the script path being used.

2. Create a `dnsmasq.postconf` script to modify the `dnsmasq` configuration dynamically before the service starts:

    ```sh {title="/jffs/scripts/dnsmasq.postconf" linenums="1" .mono-title}
    --8<-- "dnsmasq.postconf"
    ```

    1. Replaces the default Asuswrt-Merlin script with the custom wrapper script

3. Create the custom wrapper script:

    :    This script will act as the middleman. Dnsmasq passes four arguments to this script automatically: Action *(`add`, `old`, or `del`)*, MAC address, IP address, and Hostname.

    ```sh {title="/jffs/scripts/dhcp-event.sh" linenums="1" hl_lines="14 15" .mono-title}
    --8<-- "dhcp-event.sh"
    ```

    1. ALWAYS execute the default Asuswrt-Merlin script first.
    2. Extract the arguments passed by dnsmasq.
    3. Only trigger the Gotify notification on new lease additions.
    4. Assign a placeholder if the device doesn't broadcast a hostname.
    5. Fire the payload via curl using Markdown formatting.

4. Apply permissions and restart `dnsmasq` service:

    ```sh linenums="1"
    chmod +x /jffs/scripts/dnsmasq.postconf
    chmod +x /jffs/scripts/dhcp-event.sh
    service restart_dnsmasq
    ```

    !!! tip

        To test it, simply disconnect a device from the network, manually delete its lease from the Asuswrt-Merlin UI *(or wait for it to expire)*, and reconnect it to force an `add` event.

#### :symbols-terminal-alt:&ensp;SSH Alerts

1. Create the script: 

    ```bash {title="Debian Servers:  /usr/local/bin/" linenums="1" .mono-title}
    sudo nano /usr/local/bin/gotify-ssh-alert.sh
    ```

    ```bash {title="ZimaOS NAS:  /opt/bin/" linenums="1" .mono-title}
    sudo nano /opt/bin/gotify-ssh-alert.sh  # (1)!
    ```

    1. Since **ZimaOS** is an immutable operating system, it is necessary to use the `/opt/bin/` directory. This ensures the script is not deleted after OS upgrades and / or system reboots.

    ```sh {title="ASUS Router:  /jffs/scripts/" linenums="1" .mono-title}
    nano /jffs/scripts/gotify-ssh-alert.sh  # (1)!
    ```

    1.    **Asuswrt-Merlin** uses an embedded Linux environment *(BusyBox)* and relies on a lightweight SSH server called **Dropbear** instead of **OpenSSH**. Because of this, it does not use Pluggable Authentication Modules (PAM) at all.
   
          Furthermore, the base filesystem on the router is read-only or wiped on reboot, so any changes made outside of the designated `/jffs/` partition are lost when the router restarts.
          
          **Asuswrt-Merlin** has a built-in feature for custom scripting via the `JFFS` partition. Instead of a PAM trigger, we can use the router's profile configuration to fire the script off whenever an interactive shell session is spawned.

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

    4. Only proceed if the session was initiated via SSH.
    5. Extract the client IP from the `SSH_CONNECTION` variable.
    6. Replace the `TOKEN` and `URL` variables with your actual Gotify App token and URL.
    7. Send the `POST` request to Gotify.

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

    ```bash {title="Debian Servers:  /etc/pam.d/sshd" linenums="1" .mono-title}
    session     optional     pam_exec.so     /usr/local/bin/gotify-ssh-alert.sh  # (1)!
    ```
      
    1. Add line to `/etc/pam.d/sshd` after the existing "session" lines.

    ```bash {title="ZimaOS NAS:  /etc/pam.d/sshd" linenums="1" .mono-title}
    session     optional     /lib/security/pam_exec.so     /opt/bin/gotify-ssh-alert.sh  # (1)!
    ```

    1. Add line to `/etc/pam.d/sshd` after the existing "session" lines.    

    ```sh {title="ASUS Router:  /jffs/configs/profile.add" linenums="1" .mono-title}
    /jffs/scripts/gotify-ssh-alert.sh &  # (1)!
    ```

    1.    Add this single line to the bottom of the file.
    
          **Note:** The `&` symbol at the end is crucial. It runs the script in the background so it doesn't hang or delay your SSH login prompt while it waits for the `curl` command to reach the Gotify server.

#### :services-uptime-kuma:&ensp;Uptime Kuma Alerts

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

#### :services-zimaos:&ensp;ZimaOS Alerts

:    The ZimaOS module, **Zima Cron**, is required to create custom cron jobs on ZimaOS. Make sure the Zima Cron module is installed with the native ZimaOS package manager, `zpkg`. Zima Cron should be installed by default on ZimaOS v1.6.0 and higher, but you can also download the Zima Cron package from the official GitHub repository, and see detailed installation instructions in the README.

    [Zima Cron&ensp;:symbols-cron:](https://github.com/chicohaager/cron){ .md-button }

##### AppData Backup

1. Create the custom script in the `/DATA/Scripts` directory:

    ```bash linenums="1"
    sudo nano /DATA/Scripts/appdata_backup.sh
    ```

2. Paste the following code into the file:

    ```bash {title="/DATA/Scripts/appdata_backup.sh" linenums="1" hl_lines="4 5" .mono-title}
    --8<-- "appdata_backup.sh"
    ```

    1. Replace the `TOKEN` and `URL` variables with your actual Gotify App token and URL.

3. Set the execute permission: 

    ```bash linenums="1"
    sudo chmod +x /DATA/Scripts/appdata_backup.sh
    ```

4. Open the **Zima Cron** Web-UI and add the cron job to execute the script with the following command:

    ```bash linenums="1"
    bash /DATA/Scripts/appdata-backup.sh
    ```

##### Docker Cleanup

1. Create the custom script in the `/DATA/Scripts` directory:

    ```bash linenums="1"
    sudo nano /DATA/Scripts/docker_cleanup.sh
    ```

2. Paste the following code into the file:

    ```bash {title="/DATA/Scripts/docker_cleanup.sh" linenums="1" hl_lines="4 5" .mono-title}
    --8<-- "docker_cleanup.sh"
    ```

    1. Replace the `TOKEN` and `URL` variables with your actual Gotify App token and URL.

3. Set the execute permission: 

    ```bash linenums="1"
    sudo chmod +x /DATA/Scripts/docker_cleanup.sh
    ```

4. Open the **Zima Cron** Web-UI and add the cron job to execute the script with the following command:

    ```bash linenums="1"
    bash /DATA/Scripts/docker_cleanup.sh
    ```

##### Temp Files Cleanup

1. Create the custom script in the `/DATA/Scripts` directory:

    ```bash linenums="1"
    sudo nano /DATA/Scripts/temp_files_clean.sh
    ```

2. Paste the following code into the file:

    ```bash {title="/DATA/Scripts/temp_files_clean.sh" linenums="1" hl_lines="4 5" .mono-title}
    --8<-- "temp_files_clean.sh"
    ```

    1. Replace the `TOKEN` and `URL` variables with your actual Gotify App token and URL.

3. Set the execute permission: 

    ```bash linenums="1"
    sudo chmod +x /DATA/Scripts/temp_files_clean.sh
    ```

4. Open the **Zima Cron** Web-UI and add the cron job to execute the script with the following command:

    ```bash linenums="1"
    bash /DATA/Scripts/temp_files_clean.sh
    ```