---
icon: services/beszel
title: Beszel
subtitle: Server Monitoring
description: A lightweight server monitoring hub with historical data, docker stats, and alerts.
tags:
  - Active
  - Container
  - Infrastructure
  - Monitor
  - Service
hide:
  - toc
---

![Beszel Logo](../assets/icons/beszel.svg){ width=200 }

# Beszel

_Server Monitoring_

[GitHub&ensp;:brands-github:](https://github.com/henrygd/beszel){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://beszel.dev/guide/what-is-beszel){ .md-button .md-button--primary }

---

![Beszel service homepage](../assets/screenshots/beszel-home-light.png#only-light){ width=400 align=right .on-glb }
![Beszel service homepage](../assets/screenshots/beszel-home-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

**Description**

:   A lightweight server monitoring hub with historical data, docker stats, and alerts. Includes the **"Hub"** container _(the main server)_ and **"Agent"** containers for connecting other servers to the hub.

**Port(s)**

- Hub:&ensp;`8090`
{ .no-bullets }
- Agent:&ensp;`45876`
{ .no-bullets }

**URL / Access**

:   <http://pi-server.internal:8090/>

**Credentials**

- [:brands-github:&ensp;GitHub OAuth](https://github.com/settings/developers){ external-link }
{ .no-bullets }
- [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }
{ .no-bullets }
    - Local Network&ensp;:symbols-move-right:&ensp;"Beszel Hub"
- 2FA / MFA
{ .no-bullets }
    - :symbols-clock-key:&ensp;TOTP

## :symbols-package-search:&ensp;Deployment Details

**Hub**

| Host Device                                                          | Method                                    | Container Name | Image            | Port(s) |
| :------------------------------------------------------------------- | :---------------------------------------- | :------------- | :--------------- | :------ |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md) | :symbols-container:&nbsp;Docker Container | `beszel-hub`   | `henrygd/beszel` | `8090`  |

**Agents**

| Host Device                                                                    | Method                                    | Container Name | Image                        | Port(s) |
| :----------------------------------------------------------------------------- | :---------------------------------------- | :------------- | :--------------------------- | :------ |
| [:symbols-layers:&nbsp;Debian Server](../02_hardware/debian_server.md)         | :symbols-container:&nbsp;Docker Container | `beszel-agent` | `henrygd/beszel-agent`       | `45876` |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md)           | :symbols-container:&nbsp;Docker Container | `beszel-agent` | `henrygd/beszel-agent`       | `45876` |
| [:symbols-server:&nbsp;Pi Zero 2W Server](../02_hardware/pi_zero_2w_server.md) | :symbols-container:&nbsp;Docker Container | `beszel-agent` | `henrygd/beszel-agent`       | `45876` |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_hardware/zimaos_nas.md)           | :symbols-container:&nbsp;Docker Container | `beszel-agent` | `henrygd/beszel-agent-intel` | `45876` |
| [:symbols-pc-case:&nbsp;Ben's Desktop](../02_hardware/bens_desktop.md)         | :symbols-tux:&nbsp;Native Linux           | `N/A`          | `N/A`                        | `45876` |
| [:symbols-laptop-minimal:&nbsp;Ben's Laptop](../02_hardware/bens_laptop.md)    | :symbols-tux:&nbsp;Native Linux           | `N/A`          | `N/A`                        | `45876` |

---

## :symbols-settings:&ensp;Configuration

--8<-- "includes/managed_by_dockge.md"

### :symbols-key-round:&ensp;Generate API Tokens

Run the following command in a terminal on a client machine to generate API tokens.

``` bash linenums="1"
curl -X POST "http://pi-server.internal:8090/api/collections/users/auth-with-password" \
  -H "Content-Type: application/json" \
  -d '{"identity":"user@example.com","password":"your-password"}'  # (1)!
```

1. Replace **"user@example.com"** with your user's email address, and **"your-password"** with your user's password.

### :symbols-file-code-corner:&ensp;Docker Compose Files

#### Pi 4B Server _(Hub)_

``` yaml { .mono-title title="/opt/stacks/beszel/docker-compose.yml" linenums="1" }
--8<-- "beszel-pi-4b.yaml"
```

#### Debian Server

``` yaml { .mono-title title="/opt/stacks/beszel-agent/docker-compose.yml" linenums="1" }
--8<-- "beszel-debian-vm.yaml"
```

#### Pi Zero 2W Server

``` yaml { .mono-title title="/opt/stacks/beszel-agent/compose.yaml" linenums="1" }
--8<-- "beszel-pi-zero.yaml"
```

#### ZimaOS NAS

``` yaml { .mono-title title="../AppData/dockge/stacks/beszel-agent/compose.yaml" linenums="1" }
--8<-- "beszel-zima.yaml"
```

1. Rename the root disk in the Beszel Hub UI with the `FILESYSTEM` environment variable. _(&ge; `v0.19.0` ONLY)_

### :symbols-tux:&ensp;Native Linux Install

1. Download and run the install script:

    ``` bash
    # Download script
    curl -sL https://get.beszel.dev -o /tmp/install-agent.sh && chmod +x /tmp/install-agent.sh 

    # Run script as `root` user
    sudo bash /tmp/install-agent.sh \
    -url http://pi-server.internal:8090 \
    -p 45876 \
    -k "public-ssh-key" \
    -t server-token \ 
    --auto-update  # (1)!
    ```

    1. Enables automatic updates for the Beszel Agent by creating `beszel-agent-update.service` and `beszel-agent-update.timer` Systemd unit files.

    | Flag            | Purpose                                                                   |
    | :-------------- | :------------------------------------------------------------------------ |
    | `-k`            | Public key _(enclose in quotes; interactive if not provided)_             |
    | `-p`            | Port or address _(default: `45876`)_                                      |
    | `-t`            | Token _(optional for backwards compatibility)_                            |
    | `-url`          | Hub URL _(optional for backwards compatibility)_                          |
    | `-v`            | Version _(default: `latest`)_                                             |
    | `-u`            | Uninstall Beszel Agent                                                    |
    | `--auto-update` | Enable or disable automatic daily updates _(interactive if not provided)_ |
    | `-h`            | Show help printout                                                        |

2. Edit the `beszel-agent.service` Systemd unit file to change the settings.

    ``` bash
    # Edit the Systemd unit file
    sudo nano /etc/systemd/system/beszel-agent.service

    # Reload Systemd Daemons
    sudo systemctl daemon-reload

    # Restart the Beszel Agent service
    sudo systemctl restart beszel-agent.service
    ```

3. Check the status of the Beszel Agent service:

    ``` bash
    systemctl status beszel-agent.service
    ```

### :symbols-file-braces-corner:&ensp;Systemd Unit Files

#### Ben's Desktop

``` systemd { .mono-title title="/etc/systemd/system/beszel-agent.service" }
--8<-- "includes/code/systemd/beszel-agent-desktop.service"
```

#### Ben's Laptop

``` systemd { .mono-title title="/etc/systemd/system/beszel-agent.service" }
--8<-- "includes/code/systemd/beszel-agent-laptop.service"
```
