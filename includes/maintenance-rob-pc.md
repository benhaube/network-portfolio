!!! config inline end "Critical Configurations"

    :symbols-refresh-cw-clock:&ensp;**Chrony**

    :    Time synchronizes with local time server running on main router, [ASUS RT-BE92U](../02_hardware/asus_rt-be92u.md), using `chrony`.

### :symbols-rotate-cw-clock:&ensp;Update Process

Automatic operating system, software, firmware, and driver updates enabled with Windows Update. Other applications not installed through the Windows app store need to be updated manually. Usually, through the application's built-in update utility.

### :symbols-cloud-upload:&ensp;Backup Policy

File backup is handled with Window's built-in backup tool. Files in the user's directory are sent to the [ZimaOS NAS](../02_hardware/zimaos_nas.md#data){ data-preview } via [SMB](../03_services/smb.md). Backups of the user files stored on the **ZimaOS NAS** are then backed up to the cloud storage provider, [Backblaze B2](https://www.backblaze.com/cloud-storage){ external-link }, to maintain the [3-2-1 Backup Strategy](../01_infrastructure/disaster_recovery_plan.md#backup-strategy).
