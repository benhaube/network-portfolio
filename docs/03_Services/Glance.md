---
icon: services/glance
title: Glance
subtitle: Server Dashboard
description: A self-hosted dashboard that puts all your feeds in one place. 
tags:
  - Active
  - Docker
  - Dashboard
  - Monitor
  - Network
  - Service
hide:
  - toc
---
![Glance Logo](../assets/icons/glance-light.svg#only-light){ width=200 }
![Glance Logo](../assets/icons/glance.svg#only-dark){ width=200 }

# Glance
*Server Dashboard*

[GitHub&ensp;:simple-github:](https://github.com/Panonim/dynacat){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-documentation-outline:](https://dynacat.artur.zone/){ .md-button .md-button--primary }

---
## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    A self-hosted dashboard that puts all your feeds in one place. 

#### :symbols-settings-ethernet:&ensp;Port(s)

+ `8580`

#### :symbols-link:&ensp;URL / Access

+ <https://glance.internal>
+ <http://pi-server.internal:8580/>

#### :symbols-key:&ensp;Credentials

+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): 
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Glance Admin"
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Glance User (bhaube)"
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Glance User (rpereira)"
    + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Glance Server Secret"

## :symbols-deployed-code-update:&ensp;Deployment Details

???+ change "Image Migration"

    :symbols-calendar-event:&ensp;**Date:** Monday, April 27 2026 <br>
    :symbols-swap-horizontal:&ensp;**Change:** Using a forked Docker image <br>
    :symbols-help:&ensp;**Reason:** Active development, additional features

    ---

    :symbols-settings:&ensp;**Configuration:**
 
    :   Changed the image to `panonim/dynacat:latest`, a fork of Glance with some added features. The standard Glance configuration is compatible, but the main configuration file needs to have a different name, `dynacat.yml`. I have left the old `glance.yml` configuration file in the directory to maintain compatibility with the official Glance image. 
 
    [:symbols-arrow-down-thin:&nbsp;**See the new config file below**&nbsp;:symbols-arrow-down-thin:](#glance-config)

| Host Device                                                                                      | Method                                | Container Name | Image                       |
| :----------------------------------------------------------------------------------------------- | :------------------------------------ | :------------- | :-------------------------- |
| [:symbols-server-outline:&nbsp;Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :services-docker:&nbsp;Docker Compose | `glance`       | `panonim/dynacat:latest`    |
|                                                                                                  | :services-docker:&nbsp;Docker Compose | `f1_api`       | `skyallinott/f1_api:latest` |

### :symbols-settings:&ensp;Configuration

??? change "User Authentication"

    :symbols-calendar-event:&ensp;**Date:** Monday, April 20 2026 <br>
    :symbols-swap-horizontal:&ensp;**Change:** Enabled user authentication <br>
    :symbols-help:&ensp;**Reason:** Additional security

    ---

    :symbols-person:&ensp;**Users:**
 
    + Glance now has authentication enabled, therefore login is required for users to access the service. The user's credentials are stored in the [Bitwarden Vault](https://vault.bitwarden.com) within the folder "Local Network". There are currently three user accounts: `admin`, `bhaube`, and `rpereira`. 

    :symbols-password:&ensp;**Passwords:**

    !!! tip inline end
    
        Restarting the container with `#!bash docker compose restart` will not allow changes to the `.env` file to take affect. It is required to use `#!bash docker compose down` and `#!bash docker compose up -d`.

    + For additional security, the passwords are not stored in clear text within the service's configuration files. Instead, the passwords are hashed, and defined in the `.env` file. 
    + To change a user's password, attach to the container's shell and run the following command: 

        ```bash linenums="1"
        ./glance password:hash <my-password>
        ```
 
    + Copy and paste the hashed string into the corresponding variable in the `.env` file, shut the container down, and start the container again. 
      
    :symbols-key:&ensp;**Server Secret:**
 
    + The "Server Secret" needs to be set in the `glance.yml` configuration file. 
    + To generate a new server secret, attach to the container's shell and run the following command: 
   
        ```bash linenums="1"
        ./glance secret:make
        ```
 
    + Copy and paste the generated string into the `glance.yml` file. 

        + **Example:**

            ```yaml {title="glance.yml (snippet)" linenums="1" .mono-title}
            auth:
            secret-key: <insert-server-secret>
            users:
            ```

    + Shut the container down and start it back up using the same method shown above for user passwords. 


??? change "Widgets Directory"

    :symbols-calendar-event:&ensp;**Date:** Saturday, April 18 2026 <br>
    :symbols-swap-horizontal:&ensp;**Change:** Moved pages and widgets into separate directories. <br>
    :symbols-help:&ensp;**Reason:** Simplify the `<page>.yml` files for easier configuration management.

    ---

    !!! tip inline end
        
        Changes to the YAML files in the `config/pages` and `config/widgets` directories are recognized by the container instantly. However, you may need to clear the browser cache when you reload the page. 
 
        **Reload and clear cache:**<br>++ctrl+f5++ 
 
    :symbols-settings:&ensp;**Configuration:**

    + The Glance dashboard widgets have been moved into their own directory to clean up the page YAML files. The new widgets directory is `/app/config/widgets/`. 
    + Using the `$include` directive, the separate widget YAML files can be added to the pages resulting in a much cleaner and easy to manage file structure. 
     
        + **Example:**

            ```yaml {title="page.yml (example)" linenums="1" .mono-title}
            columns:
              
              - size: full
                widgets:         
                  
                  - $include: /app/config/widgets/search.yml
            ```

    :symbols-widgets-outline:&ensp;**Widgets:**
 
    + To avoid putting a code block for every widget on this page, you can instead visit the GitHub repository containing all of the widgets included in the repository. 
 
        [Glance Widgets&ensp;:brands-github:](https://github.com/benhaube/glance-pages/tree/main/config/widgets){ .md-button }

#### :services-docker:&ensp;Docker Compose

```yaml {title="compose.yml" linenums="1" .mono-title}
--8<-- "glance-compose.yml"
```

1. **Optional:** Mount docker socket if you want to use the docker containers widget
2. Use the file, `.env`, to store tokens / secrets and URLs for Widgets. Do **NOT** put API tokens directly into the Glance pages.
3. It is required to define DNS server IP addresses for the container to resolve custom `.internal` FQDN. 
4. Specify your timezone.
5. Specify desired track map color
6. **Optional:** "Main" tracks qualifying sessions and races *(inc. sprints)*. "Race" tracks **only** races. 
7. Changed the Docker image to **Dynacat**, a fork of Glance with added features.

#### :symbols-cogs:&ensp;Glance Config

```yaml {title="dynacat.yml" linenums="1" .mono-title}
--8<-- "dynacat.yml"
```

1. The directory, `/app/assets`, contains all of the custom icons and CSS used in the Glance pages.
2.    Assets are cached by the browser, changes to the CSS file will not be reflected until the browser cache is cleared...
      
      **Refresh & clear cache:**
      
      + Use the key combination,&ensp;++ctrl+f5++

3.    The Glance Dashboard's server secret is stored in the Bitwarden Vault.

      [:services-bitwarden:&ensp;**Bitwarden:**](https://vault.bitwarden.com)

      + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Glance Server Secret"

4.    The file, `app/.env`, contains the hashed passwords. To change a user's password and generate the hash, enter the container's shell and use the following command:

      ```sh linenums="1"
      ./glance password:hash <my-password>
      ```
      
      Then paste the hashed string into the corresponding variable in the `.env` file.

5.    Values for the colors are in **HSL** format. You can use a **color picker** like [this one](https://colorpicker.dev/#121212) to convert colors from other formats.
 
      :services-it-tools:&ensp;**IT-Tools:**
      
      + Another service hosted on this local network, [IT-Tools](./IT-Tools.md), also has a great [color converter](http://pi-server.internal:8080/color-converter).  

6.    Used to increase or decrease the contrast of the text. A value of `1.5` means that the text will be 50% **lighter / darker** depending on the scheme. 

      Use this if you think that some of the text on the page is too dark and hard to read

```yaml {title="glance.yml" linenums="1" .mono-title} 
--8<-- "glance.yml"
```

1. The directory, `/app/assets`, contains all of the custom icons and CSS used in the Glance pages.
2.    Assets are cached by the browser, changes to the CSS file will not be reflected until the browser cache is cleared...
      
      **Refresh & clear cache:**
      
      + Use the key combination,&ensp;++ctrl+f5++

3.    The Glance Dashboard's server secret is stored in the Bitwarden Vault.

      [:services-bitwarden:&nbsp;**Bitwarden:**](https://vault.bitwarden.com)

      + Local Network&ensp;:symbols-arrow-right-thin:&ensp;"Glance Server Secret"

4.    The file, `app/.env`, contains the hashed passwords. To change a user's password and generate the hash, enter the container's shell and use the following command:

      ```sh linenums="1"
      ./glance password:hash <my-password>
      ```
      
      Then paste the hashed string into the corresponding variable in the `.env` file.

5.    Values for the colors are in **HSL** format. You can use a **color picker** like [this one](https://colorpicker.dev/#121212) to convert colors from other formats.
 
      :services-it-tools:&ensp;**IT-Tools:**
      
      + Another service hosted on this local network, [IT-Tools](./IT-Tools.md), also has a great [color converter](http://pi-server.internal:8080/color-converter).  

6.    Used to increase or decrease the contrast of the text. A value of `1.5` means that the text will be 50% **lighter / darker** depending on the scheme. 

      Use this if you think that some of the text on the page is too dark and hard to read

#### :symbols-layout-dashboard:&ensp;Glance Pages

```yaml {title="home.yml" linenums="1" .mono-title}
--8<-- "glance-home.yml"
```

1. Show a title header on mobile device web browsers.
2. **Optional:** If you only have a single page you can hide the desktop navigation for a cleaner look.

```yaml {title="network.yml" linenums="1" .mono-title}
--8<-- "glance-network.yml"
```

1. Show a title header on mobile device web browsers.
2. **Optional:** If you only have a single page you can hide the desktop navigation for a cleaner look.
3.    :symbols-bug-report:&ensp;**Bug:** 

      + Disabled **WireGuard** community widget for now due to bugs causing page instability and other issues. 

```yaml {title="formula1.yml" linenums="1" .mono-title}
--8<-- "glance-formula1.yml"
```

1. Show a title header on mobile device web browsers.
2. **Optional:** If you only have a single page you can hide the desktop navigation for a cleaner look.
