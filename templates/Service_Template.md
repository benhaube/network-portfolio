---
tags:
  - active
  - service
  - software
  - docker
hide:
  - toc
---
![[service-logo.svg|200]]

# [[Service_Template|Service Template]]
[GitHub :material-github:](https://github.com){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://docs.github.com/en){ .md-button }

---
## :material-information-outline: Overview

* **Purpose:** 
* **Port(s):** `port`
* **URL / Access:**
    * <https://example.com>
* **Credentials:** 
    * :services-bitwarden:&nbsp;[Bitwarden](https://vault.bitwarden.com): ""

## :material-package-down: Deployment Details

* **Host Device:** &nbsp;:icon-host-device:&nbsp;[[Host_Device]]
* **Method:** &nbsp;:material-docker:&nbsp;Docker Compose
* **Container Name:** `container-name`
* **Image:** `image_name:tag`

### :material-cog: Configuration 

```bash title="" linenums="1"
# Paste your docker-compose.yaml or docker run command here!
docker run -d \
  --name=homeassistant \
  --restart=unless-stopped \
  -v /path/to/config:/config \
  --network=host \
  homeassistant/home-assistant:stable
```