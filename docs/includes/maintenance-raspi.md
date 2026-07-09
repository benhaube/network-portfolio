!!! config inline "Critical Configurations"

    **:symbols-web-clock:&ensp;Chrony:**

    :    Do not modify NTP settings or enable `systemd-timesyncd`. It has been replaced with [Chrony](../03_Services/Chrony.md). The Chrony service is hosted on the main router, [ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md).
   
    **:symbols-notes:&ensp;Logs:**

    :    Logs are configured with `log2ram` to reduce wear on the MicroSD card.
 
    **:symbols-mail-asterisk:&ensp;Email Notifications:**

    :    This server has email & push notifications configured for new SSH sessions and `unattended-upgrades`. See [Setup SSH Login Notification](../Linux_Tutorials/Setup_SSH_Login_Email_Notification.md) for documentation.

#### :symbols-update:&ensp;Update Process

+ The `unattended-upgrades` service is enabled for critical bug fixes and CVE patches to apply automatically.
+ Manual OS updates can be applied with the `apt` package manager. *(Standard Debian)*
  
    ```bash linenums="1"
    sudo apt update && sudo apt upgrade
    ```

+ Updates for services using a Docker image can be applied manually with `docker compose` or by using the update utility in [Dockge](../03_Services/Dockge.md)

#### :symbols-backup:&ensp;Backup Policy

+ An image of the MicroSD card is stored on [ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md). 
    + Path: `/media/Quick-Storage/Backup/<hostname>`
+ Data and configurations from Docker services are backed up to [ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md). 
    + Path: `/media/Quick-Storage/Backup/<hostname>/stacks`
+ Critical configuration files are backed up to the attached USB flash drive.
+ All backed up files stored on the **ZimaOS NAS** are then backed up to the cloud storage provider, [Backblaze B2](https://www.backblaze.com/cloud-storage), to maintain the [3-2-1 Backup Strategy](../01_Infrastructure/Disaster_Recovery_Plan.md#backup-strategy).

--8<-- "nerd-fonts.md"

#### :symbols-rocket:&ensp;Starship Terminal Prompt

The Starship terminal prompt is a cross-platform, cross-shell application that replaces the standard shell prompt on your Android, BSD, Windows, Linux, or MacOS computer. It is compatible with Bash, Cmd, Elvish, Fish, Ion, Nutshell, Powershell, Tcsh, Xonsh, and Zsh. 

1. Install the latest version:

    ```bash linenums="1"
    curl -sS https://starship.rs/install.sh | sh
    ```

2. Add init script to shell's config file: 

    ```bash linenums="1"
    eval "$(starship init bash)"
    ```

3. Place the custom config file in the `~/.config` directory:

    ```toml {title="starship.toml" linenums="1" .mono-title}
    --8<-- "starship-raspi.toml"
    ```

#### :symbols-login:&ensp;Fastfetch Login Preset

The Fastfetch Login Preset prints a customized Fastfetch output with relevant information every time a new terminal session is started. I have all variants of the preset hosted in a code repository on [GitHub](https://github.com/benhaube/fastfetch-login-preset).

1. Install Fastfetch: 

    ```bash linenums="1"
    sudo apt update
    sudo apt install fastfetch
    ```

2. Copy the `login.jsonc` preset file into the presets directory:

    ```bash linenums="1"
    sudo cp login.jsonc /usr/share/fastfetch/presets
    ```

3. Add the `fastfetch` command to the `~/.bashrc` file: 

    ```bash linenums="1"
    fastfetch -c login
    ```

##### Fastfetch Preset File

```json {title="/usr/share/fastfetch/presets/login.jsonc" linenums="1" .mono-title}
--8<-- "fastfetch-login-pi-server.jsonc"
```