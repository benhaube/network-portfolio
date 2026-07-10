---
icon: services/homebox
title: Homebox
subtitle: Inventory Management
description: An inventory and organization system built for the home user.
status: new
tags:
  - Active
  - Docker
  - Inventory
  - New
  - Service
hide:
  - toc
---
![Homebox Logo](../assets/icons/homebox.svg){ width=200 }

# Homebox
*Inventory Management*

[GitHub&ensp;:brands-github:](https://github.com/sysadminsmedia/homebox){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-file-text:](https://homebox.software/en/quick-start/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description 

:    An inventory and organization system built for the home user.

#### :symbols-settings-ethernet:&ensp;Port(s) 

+ `3100`

#### :symbols-link-alt:&ensp;URL / Access 

+ <http://storage-server.internal:3100>
+ <http://storage-server-2.internal:3100>
+ <http://192.168.50.4:3100>

#### :symbols-user-key:&ensp;Credentials 

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Homebox"

## :symbols-deployed-code-update:&ensp;Deployment Details

| Host Device                                                               | Method                                | Container Name | Image                                   |
| :------------------------------------------------------------------------ | :------------------------------------ | :------------- | :-------------------------------------- |
| [:symbols-server-nas:&nbsp;ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :services-docker:&nbsp;Docker Compose | `homebox`      | `ghcr.io/sysadminsmedia/homebox:latest` |

### :symbols-settings:&ensp;Configuration

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "homebox.yml"
```

1. Please consider allowing analytics to help us improve Homebox *(basic computer information, no personal data)*.
2.     Use a strong random string for the pepper in production, it will be used to hash API keys and make them more secure. 

       To generate a random string use the following command:
       
      
       ```bash linenums="1"
       openssl rand -base64 48
       ```