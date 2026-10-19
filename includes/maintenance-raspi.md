!!! config inline end "Critical Configurations"

    :symbols-refresh-cw-clock:&ensp;**Chrony**

    :    Do not modify NTP settings or enable `systemd-timesyncd`. It has been replaced with [Chrony](../03_services/chrony.md). The Chrony service is hosted on the main router, [ASUS RT-BE92U](../02_hardware/asus_rt-be92u.md).

    :symbols-logs:&ensp;**Logs**

    :    Logs are configured with `log2ram` to reduce wear on the MicroSD card.

    :symbols-mail-warning:&ensp;**Email Notifications**

    :    This server has email & push notifications configured for new SSH sessions and `unattended-upgrades`. See [Setup SSH Login Notification](../linux_tutorials/setup_ssh_login_notification.md) for documentation.

### :symbols-rotate-cw-clock:&ensp;Update Process

The `unattended-upgrades` service is enabled for critical bug fixes and CVE patches to apply automatically. Manual OS updates can be applied with the `apt` package manager. Updates for services using a Docker image can be applied manually with `docker compose` or by using the update utility in [Dockge](../03_services/dockge.md).

#### Manual Updates

To update Debian packages manually with the `apt` package manager use the following command:

``` bash linenums="1"
sudo apt update && sudo apt upgrade
```

### :symbols-cloud-upload:&ensp;Backup Policy

An image of the MicroSD card is stored on [ZimaOS NAS](../02_hardware/zimaos_nas.md). Data and configurations from Docker services are backed up to [ZimaOS NAS](../02_hardware/zimaos_nas.md). Critical configuration files are backed up to the attached USB flash drive. All backed up files stored on the **ZimaOS NAS** are then backed up to the cloud storage provider, [Backblaze B2](https://www.backblaze.com/cloud-storage){ external-link }, to maintain the [3-2-1 Backup Strategy](../01_infrastructure/disaster_recovery_plan.md#backup-strategy).

| Contents     | Path                                            |
| :----------- | :---------------------------------------------- |
| Docker Data  | `/media/Quick-Storage/Backup/<hostname>/stacks` |
| System Image | `/media/Quick-Storage/Backup/<hostname>`        |

### :symbols-broom-sparkles:&ensp;Docker Cleanup { #docker-cleanup }

Over time the Docker container management system builds up a lot of stale data which can fill up the system drive. This data includes temporary cache, unused containers, dangling volumes, and old or outdated images. To keep the Docker system from accumulating too much unwanted data we have written a script to perform a Docker system cleanup, and the script is automated using Systemd unit files. The `docker-cleanup.sh` script will run weekly on Mondays at 10:00 UTC. Built into the script is a push notification sent through the [Gotify](../03_services/gotify.md) server to report cleanup success or failure as well as how much data was removed.

1.  Place the `docker-cleanup.sh` Bash script in the `/opt/scripts` directory.

    ``` bash { .mono-title title="/opt/scripts/docker-cleanup.sh" hl_lines="3 4" }
    --8<-- "docker-cleanup_pi-server.sh"
    ```

2.  Give restricted read permissions to the script to ensure only the `root` user can read the Gotify token. The script should be executable by all users and groups with read and write permissions for the `root` user only.

    ``` bash
    sudo chmod 711 /opt/scripts/docker-cleanup.sh

    # Example
    -rwx--x--x 1 root root 1089 Oct 10 14:19 docker-cleanup.sh
    ```

3.  Create the Systemd service unit file in the `/etc/systemd/system` directory.

    ``` systemd { .mono-title title="/etc/systemd/system/docker-cleanup.service" }
    --8<-- "docker-cleanup.service"
    ```

4.  Create the Systemd timer unit file in the `/etc/systemd/system` directory.

    ``` systemd { .mono-title title="/etc/systemd/system/docker-cleanup.timer" }
    --8<-- "docker-cleanup.timer"
    ```

5.  Reload Systemd to load the new unit files.

    ``` bash
    sudo systemctl daemon-reload
    ```

6.  Enable the Systemd timer unit.

    ``` bash
    sudo systemctl enable --now docker-cleanup.timer
    ```

7.  Run the Systemd service manually to test the script, and watch for the Gotify notification.

    ``` bash
    sudo systemctl start docker-cleanup.service
    ```

8.  Use either of the following commands to see the logs and check the status of the service.

    ``` bash
    sudo systemctl status docker-cleanup.service
    sudo journalctl -u docker-cleanup.service
    ```

--8<-- "nerd-fonts.md"

### :symbols-rocket:&ensp;Starship Terminal Prompt

The Starship terminal prompt is a cross-platform, cross-shell application that replaces the standard shell prompt on your Android, BSD, Windows, Linux, or MacOS computer. It is compatible with Bash, Cmd, Elvish, Fish, Ion, Nutshell, Powershell, Tcsh, Xonsh, and Zsh.

[Starship&ensp;:brands-github:](https://github.com/starship/starship){ .md-button }

#### Install

1.  Install the latest Starship version:

    ``` bash linenums="1"
    curl -sS https://starship.rs/install.sh | sh
    ```

2.  Add init script to shell's config file:

    ``` bash linenums="1"
    eval "$(starship init bash)"
    ```

3.  Place the custom config file in the `~/.config` directory:

    ``` toml { .mono-title title="~/.config/starship.toml" linenums="1" }
    --8<-- "starship-raspi.toml"
    ```

#### Auto Update

1.  Download the Starship install script to the `/opt/scripts` directory, and save with the filename `starship-install.sh`:

    ``` bash
    sudo curl -sS https://starship.rs/install.sh -o /opt/scripts/starship-install.sh
    ```

2.  Give the script execute permission:

    ``` bash
    sudo chmod 711 /opt/scripts/starship-install.sh
    ```

3.  Create the Systemd service unit file:

    ``` systemd { .mono-title title="/etc/systemd/system/starship-update.service" }
    [Unit]
    Description=Weekly Starship.rs update script

    [Service]
    Type=oneshot
    ExecStart=/opt/scripts/starship-install.sh -f

    [Install]
    WantedBy=multi-user.target
    ```

4.  Create the Systemd timer unit file:

    ``` systemd { .mono-title title="/etc/systemd/system/starship-update.timer" }
    [Unit]
    Description=Run weekly Starship.rs update script

    [Timer]
    OnCalendar=Sun 07:00:00
    Persistent=true
    RandomizedDelaySec=5m

    [Install]
    WantedBy=timers.target
    ```

5.  Reload Systemd daemons and enable timer unit:

    ``` bash
    sudo systemctl daemon-reload
    sudo systemctl enable --now starship-update.timer
    ```

### :symbols-log-in:&ensp;Fastfetch Login Preset

![Fastfetch login preset on Debian Server](../assets/screenshots/ssh-pi-server-light.png#only-light){ .on-glb width=340 align=right }
![Fastfetch login preset on Debian Server](../assets/screenshots/ssh-pi-server-dark.png#only-dark){ .on-glb width=340 align=right }

The Fastfetch Login Preset prints a customized Fastfetch output that shows relevant information every time a new terminal session is started. All variants of the preset are hosted in a code repository on GitHub.

[Fastfetch Presets&ensp;:brands-github:](https://github.com/benhaube/fastfetch-login-preset){ .md-button }

#### Install & Configure

1.  Install Fastfetch:

    ``` bash linenums="1"
    sudo apt update
    sudo apt install fastfetch
    ```

2.  Copy the `login.jsonc` preset file into the presets directory:

    ``` bash linenums="1"
    sudo cp login.jsonc /usr/share/fastfetch/presets
    ```

3.  Add the `fastfetch` command to the `~/.bashrc` file:

    ``` bash linenums="1"
    fastfetch -c login
    ```

#### Fastfetch Preset File

``` json { .mono-title title="/usr/share/fastfetch/presets/login.jsonc" linenums="1" }
--8<-- "fastfetch-login-pi-server.jsonc"
```

1.  Sets the width of the percentage bars.
2.  **Options:**

    - `1` = number
    - `2` = bar
    - `3` = both
    - `9` = colored number

3.  **Options:**

    - `string`
    - `icon`
    - `both`
    - `none`

4.  Aligns all keys to this uniform width.
5.  Sets the separator symbol used between the keys and values.
