---
icon: material/web-refresh
title: DDNS
subtitle: Provided by addr.tools
tags:
  - Active
  - Service
  - Software
  - Native
  - DNS
  - Domain
  - Infrastructure
  - Network
hide:
  - toc
---
![Material Design 'web-refresh' icon ](../assets/icons/ddns.svg){ width=200 }

# DDNS
*Provided by addr.tools*

[GitHub&ensp;:simple-github:](https://github.com/brianshea2/addr.tools){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation:](https://myaddr.tools/){ .md-button .md-button--primary }&emsp;[addr.tools&ensp;:services-addr:](https://addr.tools){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-description:&ensp;Description
:    A networking service that automatically maps a static domain name *(hostname)* to a dynamic public IP address. On this local network, the DDNS service is provided by [addr.tools](https://addr.tools).
 
#### :symbols-settings-ethernet:&ensp;Port(s) 

+ `N/A`

#### :symbols-link:&ensp;URL / Access

+ <https://rac3r4life.myaddr.dev>

#### :symbols-key:&ensp;Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:material-arrow-right-thin:&ensp;"DDNS Key (myaddr.tools)"

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                            | Method                             | Container Name | Image |
| :--------------------------------------------------------------------- | :--------------------------------- | :------------- | :---- |
| [:symbols-router:&nbsp;ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md) | :material-linux:&nbsp;Native Linux | `N/A`          | `N/A` |

### :symbols-settings:&ensp;Configuration 

#### :symbols-terminal-alt:&ensp;Router Script

1. Create a script on the router in the `/jffs/scripts` directory to update the IP every time it changes:

    ```sh linenums="1"
    nano /jffs/scripts/ddns-start
    ```

2. Paste this code into the file, then save and close.

    !!! note inline end
    
        The `ddns-start` script also contains the code send a WAN IP change notification to the [Gotify](./Gotify.md) server. 

    ```sh title="<code>/jffs/scripts/ddns-start</code>" linenums="1" hl_lines="5 13 14"
    --8<-- "ddns-start.sh"
    ```

    1. Replace the `TOKEN` and `URL` variables with your actual Gotify App token and URL.
    2. `$1` is the new IP passed by the router.
    3.    Replace the `KEY` variable with the key provided by addr.tools for your domain name. The Key is stored in the Bitwarden vault.
          
          [:services-bitwarden:&ensp;**Bitwarden:**](https://vault.bitwarden.com)

          + Local Network&ensp;:material-arrow-right-thin:&ensp;"DDNS Key (myaddr.tools)"

3. Make the script executable:

    ```sh linenums="1"
    chmod +x /jffs/scripts/ddns-start
    ```

4. Make sure the DDNS setting in the router's Web-UI is set to "Custom" and the "Host Name" field has your domain name:

<figure markdown="span">
    ![ASUS Router DDNS Settings](../assets/screenshots/ddns-settings.png){ width=700 }
</figure>

#### :symbols-license:&ensp;TLS Certificate

1. Install the `certbot` package on a separate PC:

    ```bash linenums="1"
    sudo dnf install -y certbot
    ```

2. Create the two shell scripts needed to obtain the Certbot validation record and transfer the TLS certificate / key to the router:

    ```bash title="<code>auth_hook.sh</code>" linenums="1" hl_lines="5"
    --8<-- "auth_hook.sh"
    ```

    1.    Replace the `KEY` variable with the key provided by addr.tools for your domain name. The Key is stored in the Bitwarden vault.
          
          [:services-bitwarden:&ensp;**Bitwarden:**](https://vault.bitwarden.com)

          + Local Network&ensp;:material-arrow-right-thin:&ensp;"DDNS Key (myaddr.tools)"
    
    2. The validation string provided by Certbot.

    ```bash title="<code>deploy_cert.sh</code>" linenums="1" hl_lines="3 4"
    --8<-- "deploy_cert.sh"
    ```

    3.    You may need to install the SFTP server on the router with Entware using the following command:
   
         ```sh linenums="1"
         opkg install openssh-sftp-server
         ```
         
         Otherwise, add the `-O` flag to both `scp` commands to use SSH instead of SFTP.

3. Make the scripts executable:

    ```bash linenums="1"
    chmod +x auth_hook.sh deploy_cert.sh
    ```

4. Run the Certbot command to get the TLS certificate from Lets Encrypt: 

    ```bash linenums="1"
    sudo certbot certonly \
      --manual \
      --preferred-challenges dns \
      --manual-auth-hook /path/to/auth_hook.sh \
      --deploy-hook /path/to/deploy_cert.sh \
      -d rac3r4life.myaddr.tools
    ```