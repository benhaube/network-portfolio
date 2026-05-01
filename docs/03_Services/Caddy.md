---
icon: simple/caddy
status: new
tags:
  - Active
  - Service
  - Software
  - Domain
  - DNS
  - Network
  - Infrastructure
  - Native
hide:
  - toc
---
![Caddy Logo](../assets/icons/caddy.svg){ width=200 }

# Caddy (Reverse-Proxy Server)
[GitHub :material-github:](https://github.com/caddyserver/caddy){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://caddyserver.com/docs/){ .md-button }

---
## :material-information-outline: Overview

#### :symbols-description: Description:  
+ Lightweight, open-source Web server written in Go. Used as a *reverse-proxy* for creating unique domains for locally hosted services.

#### :symbols-settings-ethernet: Port(s): 
+ `80`
+ `443`

#### :material-link-variant: URL / Access: 
+ <https://pi-zero.internal>

#### :material-key-chain: Credentials: 
+ N/A

## :symbols-deployed-code-update: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-raspberry-pi:&nbsp;[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md) | :material-linux:&nbsp;Native Linux *(Systemd)* | `N/A` | `N/A` |

### :material-cog: Configuration 

#### :symbols-install-desktop: Install:

1. Add the official Caddy repository. 

    ```bash linenums="1"
    sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https curl
    
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
    
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
    ```

2. Install the package.

    ```bash linenums="1"
    sudo apt update
    sudo apt install caddy
    ```

3. Edit the configuration.

    ```bash linenums="1"
    sudo nano /etc/caddy/Caddyfile
    ```

4. Apply configuration changes by reloading the Systemd service.

    ```bash linenums="1"
    sudo systemctl reload caddy
    ```

#### :material-file-cog: The 'Caddyfile' *(configuration file)*:

```nginx title="/etc/caddy/Caddyfile" linenums="1"
--8<-- "Caddyfile"
```

1. Set this path to your site's directory.
2. Enable the static file server. 
3. Another common task is to set up a reverse proxy.
4. Or serve a PHP site through php-fpm.
5. Refer to the [Caddy Docs](https://caddyserver.com/docs/caddyfile) for more information. 
