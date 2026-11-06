---
icon: services/uptime-kuma
title: Uptime Kuma
subtitle: A Fancy Monitoring Tool
description: A fancy self-hosted service monitoring tool.
tags:
  - Active
  - Container
  - Monitor
  - Network
  - Service
hide:
  - toc
---

![Uptime Kuma Icon](../assets/icons/uptime-kuma.svg){ width=200 }

# Uptime Kuma

_A Fancy Monitoring Tool_

[GitHub&ensp;:brands-github:](https://github.com/louislam/uptime-kuma){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://github.com/louislam/uptime-kuma/wiki){ .md-button .md-button--primary }

---

![Uptime Kuma homepage](../assets/screenshots/uptime-kuma-dashboard-light.png#only-light){ width=400 align=right .on-glb }
![Uptime Kuma homepage](../assets/screenshots/uptime-kuma-dashboard-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

A fancy self-hosted service monitoring tool.

![status badge](https://uptime.rac3r4life.online/api/badge/177/status)&ensp;![uptime badge](https://uptime.rac3r4life.online/api/badge/177/uptime)&ensp;![cert expire badge](https://uptime.rac3r4life.online/api/badge/139/cert-exp)&ensp;![GitHub Release](https://img.shields.io/github/v/release/louislam/uptime-kuma?label=Release&color=%235BDB8A)

**Port(s)**

- `2375`
{ .no-bullets }
- `3001`
{ .no-bullets }

**URL / Access**

- <https://uptime.internal>
{ .no-bullets }
- <http://pi-server.internal:3001>
{ .no-bullets }
- <https://uptime.rac3r4life.online>
{ .no-bullets }

**Credentials**

-   [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }
{ .no-bullets }
    - Local Network&ensp;:symbols-move-right:&ensp;"Uptime Kuma"
-   2FA / MFA
{ .no-bullets }
    - :symbols-clock-key:&ensp;TOTP

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                          | Method                                    | Container Name | Image                                  | Status                                                                                                           | Port(s) |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :------------------------------------- | :--------------------------------------------------------------------------------------------------------------- | :------ |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md) | :symbols-container:&nbsp;Docker Container | `uptime-kuma`  | `louislam/uptime-kuma:2`               | ![status badge](https://uptime.rac3r4life.online/api/badge/111/status?label=){ style='vertical-align: middle;' } | `3001`  |
| -                                                                    | :symbols-container:&nbsp;Docker Container | `docker-proxy` | `tecnativa/docker-socket-proxy:latest` | ![status badge](https://uptime.rac3r4life.online/api/badge/178/status?label=){ style='vertical-align: middle;' } | `2375`  |

---

## :symbols-settings:&ensp;Configuration

--8<-- "managed_by_dockge.md"

### :symbols-folder-git-2:&ensp;Data Directories

| Contents            | Path                                   |
| :------------------ | :------------------------------------- |
| Docker Compose File | `/opt/stacks/uptime-kuma/compose.yaml` |
| Application Data    | Docker Volume: `kuma-data`             |

### :symbols-file-code-corner:&ensp;Docker Compose File

``` yaml { .mono-title title="/opt/stacks/uptime-kuma/compose.yaml" linenums="1" }
--8<-- "uptime-kuma.yml"
```

### :symbols-hard-drive-upload:&ensp;Docker Volume Backup

This container stores data in a Docker volume. This means a special process is needed to back up the service's database. The recommended way to back up the data inside a Docker volume is to spawn a temporary container, mount the desired volume alongside a local host folder, and use `tar` to compress the data.

Because Uptime Kuma uses an SQLite database, you must never back up the files while the database is running due to the risk of a corrupted backup. I have written a Bash script to make this process easier.

#### Backup Script

1.  Create the backup directory.

    ``` bash
    sudo mkdir -p /opt/kuma-backups
    ```

2.  Create the backup script.

    ``` bash
    sudo nano /opt/scripts/backup-kuma.sh
    ```

    Paste in the following code:

    ``` bash
    --8<-- "backup-kuma.sh"
    ```

    1. **Optional:** Delete backups older than 14 days to save space.

3.  Make the script executable.

    ``` bash
    sudo chmod +x /opt/scripts/backup-kuma.sh
    ```

4.  Run the script.

    ``` bash
    sudo /opt/scripts/backup-kuma.sh
    ```

5.  After a few minutes, verify a new `.tar.gz` archive was successfully generated.

    ``` bash
    ls -lh /opt/kuma-backups
    ```

??? note

    The backup script does not need to be automated because the Uptime Kuma database does not change often. As long as you remember to run the backup manually after making changes to the service. However, you can automate the backup script using the `crontab` if desired.

    1. Open the `crontab` editor.

        ``` bash
        sudo crontab -e
        ```

    2. Append the following line to the bottom of the file to run the backup every Sunday at 2:00 AM:

        ``` text
        0 2 * * 0 /opt/backup-kuma.sh
        ```

#### Restore Backup

!!! warning inline end

    You must stop the Uptime Kuma container before running the restore command. Extracting files while the SQLite database is actively running and locked will cause severe database corruption.

To safely restore a corrupted database, you need to extract the `.tar.gz` archive back into the volume using a temporary container.

1. Stop the running container.

    ``` bash
    docker stop uptime-kuma
    ```

    - **Verification:** Run `docker ps` to ensure `uptime-kuma` is no longer in the list of running containers.
    { .no-bullets }

2. List the contents of your backup directory to find the specific archive you want to restore from.

    ``` bash
    ls -lh /opt/kuma-backups
    ```

    - **Verification:** Identify the exact filename _(e.g., `uptime-kuma-20261105.tar.gz`)_ from the output.
    { .no-bullets }

3. Run a temporary Alpine container to mount the volume and extract the archive directly into it. Replace `YYYYMMDD` with the date of your chosen backup file.

    ``` bash
    docker run --rm \
    -v kuma-data:/data \
    -v /opt/kuma-backups:/backup \
    alpine sh -c "rm -rf /data/* && tar xzf /backup/uptime-kuma-YYYYMMDD.tar.gz -C /data"
    ```

    - **Verification:** The command will complete silently and return you to the prompt if successful. If you see **"No such file or directory"**, double-check the date in the filename.
    { .no-bullets }

4. Start the container so it boots up using the freshly restored database.

    ``` bash
    docker start uptime-kuma
    ```

    - **Verification:** Navigate to your Uptime Kuma web interface. Your historical ping data and monitors from the time of the backup will be fully restored.
    { .no-bullets }
