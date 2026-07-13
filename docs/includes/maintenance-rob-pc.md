!!! config inline "Critical Configurations"

    **:symbols-clock-refresh-cw:&ensp;Chrony:**
    
    + Time synchronizes with local time server running on main router, [ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md), using `chrony`.

#### :symbols-update:&ensp;Update Process 

+ Automatic OS, software, firmware, and driver updates enabled with Windows Update.

#### :symbols-cloud-upload:&ensp;Backup Policy 

+ File backup is handled with Window's built-in backup tool. Files in the user's directory are sent to the [ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) via [SMB](../03_Services/SMB.md).
+ Backups of the user files stored on the **ZimaOS NAS** are then backed up to the cloud storage provider, [Backblaze B2:symbols-external-link-small:](https://www.backblaze.com/cloud-storage), to maintain the [3-2-1 Backup Strategy](../01_Infrastructure/Disaster_Recovery_Plan.md#backup-strategy).