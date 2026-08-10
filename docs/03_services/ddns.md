---
icon: symbols/cloud-sync
title: DDNS
subtitle: Provided by addr.tools
description: A networking service that automatically maps a static domain name (FQDN) to a dynamic public IP address. On this LAN, the DDNS service is provided by addr.tools.
tags:
  - Active
  - DNS
  - Infrastructure
  - Native
  - Network
  - Service
hide:
  - toc
---

![Lucide 'cloud-cog' icon](../assets/icons/cloud-sync.svg){ width=200 }

# DDNS

_Provided by addr.tools_

[GitHub&ensp;:brands-github:](https://github.com/brianshea2/addr.tools){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://myaddr.tools/){ .md-button .md-button--primary }&emsp;[addr.tools&ensp;:symbols-square-terminal:](https://addr.tools){ .md-button .md-button--primary }

---

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    A networking service that automatically maps a static domain name _(FQDN)_ to a dynamic public IP address. On this local network, the DDNS service is provided by [addr.tools](https://addr.tools){ external-link }.

#### :symbols-hash:&ensp;Port(s) 

:    `N/A`

#### :symbols-link-2:&ensp;URL / Access 

:    <https://rac3r4life.myaddr.dev>

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }

    - Local Network&ensp;:symbols-move-right:&ensp;"DDNS Key (myaddr.tools)"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                            | Method                          | Container Name | Image |
| :--------------------------------------------------------------------- | :------------------------------ | :------------- | :---- |
| [:symbols-router:&nbsp;ASUS RT-BE92U](../02_hardware/asus_rt-be92u.md) | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration

#### :symbols-file-terminal:&ensp;Router Script

1.  Create a script on the router in the `/jffs/scripts` directory to update the IP every time it changes:

    ``` sh linenums="1"
    nano /jffs/scripts/ddns-start
    ```

2.  Paste this code into the file, then save and close.

    !!! note inline end

        The `ddns-start` script also contains the code needed to send a WAN IP change notification to the [Gotify](gotify.md#notifications){ data-preview } server.

    ``` sh { .mono-title title="/jffs/scripts/ddns-start" linenums="1" hl_lines="5 13 14" }
    --8<-- "ddns-start.sh"
    ```

    1.  Replace the `TOKEN` and `URL` variables with your actual Gotify App token and URL.
    2.  `$1` is the new IP passed by the router.
    3.  Replace the `KEY` variable with the key provided by addr.tools for your domain name. The Key is stored in the Bitwarden vault.

        [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }

        - Local Network&ensp;:symbols-move-right:&ensp;"DDNS Key (myaddr.tools)"

3.  Make the script executable:

    ``` sh linenums="1"
    chmod +x /jffs/scripts/ddns-start
    ```

4.  Make sure the DDNS setting in the router's Web-UI is set to "Custom" and the "Host Name" field has your domain name:

<figure markdown="span">
    ![ASUS Router DDNS Settings](../assets/screenshots/ddns-settings.png){ width=700 }
</figure>

#### :symbols-award:&ensp;TLS Certificate

1.  Install the `certbot` package on a separate PC:

    ``` bash linenums="1"
    sudo dnf install -y certbot
    ```

2.  Create the two shell scripts needed to obtain the Certbot validation record and transfer the TLS certificate / key to the router:

    ``` bash { .mono-title title="auth_hook.sh" linenums="1" hl_lines="5" }
    --8<-- "auth_hook.sh"
    ```

    1.  Replace the `KEY` variable with the key provided by addr.tools for your domain name. The Key is stored in the Bitwarden vault.

        [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com){ external-link }

        - Local Network&ensp;:symbols-move-right:&ensp;"DDNS Key (myaddr.tools)"

    2.  The validation string provided by Certbot.

    ``` bash { .mono-title title="deploy_cert.sh" linenums="1" hl_lines="3 4" }
    --8<-- "deploy_cert.sh"
    ```

    3.    You may need to install the SFTP server on the router with Entware using the following command:

        ``` sh linenums="1"
        opkg install openssh-sftp-server
        ```

         Otherwise, add the `-O` flag to both `scp` commands to use SSH instead of SFTP.

3.  Make the scripts executable:

    ``` bash linenums="1"
    chmod +x auth_hook.sh deploy_cert.sh
    ```

4.  Run the Certbot command to get the TLS certificate from Lets Encrypt:

    ``` bash linenums="1"
    sudo certbot certonly \
      --manual \
      --preferred-challenges dns \
      --manual-auth-hook /path/to/auth_hook.sh \
      --deploy-hook /path/to/deploy_cert.sh \
      -d rac3r4life.myaddr.tools
    ```