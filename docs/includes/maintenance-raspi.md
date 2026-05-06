!!! config inline "Critical Configurations"

    **:material-web-clock: Chrony:**

    :    Do not modify NTP settings or enable `systemd-timesyncd`. It has been replaced with [Chrony](../03_Services/Chrony.md). The Chrony service is hosted on the main router, [ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md).
   
    **:material-text-long: Logs:**

    :    Logs are configured with `log2ram` to reduce wear on the MicroSD card.
 
    **:material-email-alert: Email Notifications:**

    :    This server has email & push notifications configured for new SSH sessions and `unattended-upgrades`. See [Setup SSH Login Notification](../Linux_Tutorials/Setup_SSH_Login_Email_Notification.md) for documentation.

#### :material-update: Update Process:

+ The `unattended-upgrades` service is enabled for critical bug fixes and CVE patches to apply automatically.
+ Manual OS updates can be applied with the `apt` package manager. *(Standard Debian)*
  
    ```bash linenums="1"
    sudo apt update && sudo apt upgrade
    ```

+ Updates for services using a Docker image can be applied manually with `docker compose` or by using the update utility in [Dockge](../03_Services/Dockge.md)

#### :material-cloud-upload-outline: Backup Policy:

+ An image of the MicroSD card is stored on [ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md). 
    + Path: `/media/Quick-Storage/Backup/<hostname>`
+ Data and configurations from Docker services are backed up to [ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md). 
    + Path: `/media/Quick-Storage/Backup/<hostname>/stacks`
+ Critical configuration files are backed up to the attached USB flash drive and the secure cloud storage provider, [p-Cloud](https://www.pcloud.com/).