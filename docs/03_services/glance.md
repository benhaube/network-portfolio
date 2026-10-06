---
icon: services/glance
title: Glance
subtitle: Server Dashboard
description: A self-hosted dashboard that puts all your feeds in one place. 
tags:
  - Active
  - Container
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

_Server Dashboard_

[GitHub&ensp;:brands-github:](https://github.com/Panonim/dynacat){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://dynacat.artur.zone/){ .md-button .md-button--primary }&emsp;[Configuration Files&ensp;:symbols-file-cog:](https://github.com/benhaube/glance-pages){ .md-button .md-button--primary }

---

![Glance dashboard Network page](../assets/screenshots/glance-network-light.png#only-light){ width=400 align=right .on-glb }
![Glance dashboard Network page](../assets/screenshots/glance-network-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

:    A self-hosted dashboard that puts all your feeds in one place.

#### :symbols-hash:&ensp;Port(s)

- `8580`
{ .no-bullets }
- `9090`
{ .no-bullets }
- `4463`
{ .no-bullets }

#### :symbols-link-2:&ensp;URL / Access

:    <http://pi-server.internal:8580/>

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }

    - Local Network&ensp;:symbols-move-right:&ensp;"Glance Admin"
    - Local Network&ensp;:symbols-move-right:&ensp;"Glance User (bhaube)"
    - Local Network&ensp;:symbols-move-right:&ensp;"Glance User (rpereira)"
    - Local Network&ensp;:symbols-move-right:&ensp;"Glance Server Secret"

## :symbols-package-search:&ensp;Deployment Details

??? change "Image Migration"

    :symbols-calendar:&ensp;**Date:** Monday, April 27 2026 <br>
    :symbols-arrow-right-left:&ensp;**Change:** Using a forked Docker image <br>
    :symbols-circle-question-mark:&ensp;**Reason:** Active development, additional features

    ---

    :symbols-settings:&ensp;**Configuration**

    :   Changed the image to `panonim/dynacat:latest`, a fork of Glance with some added features. The standard Glance configuration is compatible, but the main configuration file needs to have a different name, `dynacat.yml`. I have left the old `glance.yml` configuration file in the directory to maintain compatibility with the official Glance image.

    [:symbols-arrow-down:&nbsp;**See the new config file below**&nbsp;:symbols-arrow-down:](#dynacat)

| Host Device                                                          | Method                                    | Container Name        | Image                               | Port(s) |
| :------------------------------------------------------------------- | :---------------------------------------- | :-------------------- | :---------------------------------- | :------ |
| [:symbols-server:&nbsp;Pi 4B Server](../02_hardware/pi_4b_server.md) | :symbols-container:&nbsp;Docker Container | `glance`              | `panonim/dynacat:latest`            | `8580`  |
|                                                                      | :symbols-container:&nbsp;Docker Container | `f1_api`              | `skyallinott/f1_api:latest`         | `4463`  |
|                                                                      | :symbols-container:&nbsp;Docker Container | `glance-github-graph` | `haumea/glance-github-graph:latest` | `9090`  |

### :symbols-settings:&ensp;Configuration

??? change "User Authentication"

    :symbols-calendar:&ensp;**Date:** Monday, April 20 2026 <br>
    :symbols-arrow-right-left:&ensp;**Change:** Enabled user authentication <br>
    :symbols-circle-question-mark:&ensp;**Reason:** Additional security

    ---

    :symbols-users:&ensp;**Users**

    - Glance now has authentication enabled, therefore login is required for users to access the service. The user's credentials are stored in the [Bitwarden Vault](https://vault.bitwarden.com){ external-link } within the folder "Local Network". There are currently three user accounts: `admin`, `bhaube`, and `rpereira`.
    { .no-bullets }

    :symbols-text-cursor-input:&ensp;**Passwords**

    !!! tip inline end

        The secrets files remain unecrypted on the host file system. Ensure you restrict file permissions on the host files so they are only readable by `root` _(e.g., `chmod -R 600 secrets/`)_.

        Restarting the container with `#!bash docker compose restart` will not allow changes to the Docker secrets files to take affect. It is required to use `#!bash docker compose down` and `#!bash docker compose up -d`.

    : For additional security, the passwords are not stored in clear text within the service's configuration files. Instead, the passwords are hashed, and defined using Docker secrets. To change a user's password, attach to the container's shell and run the following command:

        ``` bash linenums="1"
        ./glance password:hash <my-password>
        ```

    : Copy and paste the hashed string into the corresponding variable in the `./secrets/user_pw_hash.txt` file, shut the container down, and start the container again.

    :symbols-key-round:&ensp;**Server Secret**

    : The "Server Secret" needs to be set in the `./secrets/auth_secret.txt` file. To generate a new server secret, attach to the container's shell and run the following command:

        ``` bash linenums="1"
        ./glance secret:make
        ```

    : Copy and paste the generated string into the `./secrets/auth_secret.txt` file.

    : Add the secret to the `glance.yml` configuration file.

        ``` yaml { .mono-title title="glance.yml (snippet)" linenums="1" }
        auth:
          secret-key: ${secret:auth_secret}
          users:
        ```

    : Shut the container down and start it back up using the same method shown above for user passwords.

??? change "Widgets Directory"

    :symbols-calendar:&ensp;**Date:** Saturday, April 18 2026 <br>
    :symbols-arrow-right-left:&ensp;**Change:** Moved pages and widgets into separate directories. <br>
    :symbols-circle-question-mark:&ensp;**Reason:** Simplify the `<page>.yml` files for easier configuration management.

    ---

    !!! tip inline end

        Changes to the YAML files in the `./config/pages` and `./config/widgets` directories are recognized by the container instantly. However, you may need to clear the browser cache when you reload the page.

        Use ++ctrl+f5++ to reload and clear the browser cache.

    :symbols-settings:&ensp;**Configuration**

    :   The Glance dashboard widgets have been moved into their own directory to clean up the page YAML files. The new widgets directory is `./config/widgets/`. Using the `$include` directive, the separate widget YAML files can be added to the pages resulting in a much cleaner and easy to manage file structure.

        ``` yaml { .mono-title title="page.yml (example)" linenums="1" }
        columns:
              
            - size: full
              widgets:         
                  
                - $include: /app/config/widgets/search.yml
        ```

    :symbols-blocks:&ensp;**Widgets**

    :   To avoid putting a code block for every widget on this page, you can instead visit the GitHub repository containing all of the widgets included in the repository.

        [Glance Widgets&ensp;:brands-github:](https://github.com/benhaube/glance-pages/tree/main/config/widgets){ .md-button }

#### :symbols-folder-git-2:&ensp;Data Directories

| Contents | Path                                |
| :------- | :---------------------------------- |
| Stack    | `/opt/stacks/glance`                |
| Secrets  | `/opt/stacks/glance/secrets`        |
| Assets   | `/opt/stacks/glance/assets`         |
| Config   | `/opt/stacks/glance/config`         |
| Pages    | `/opt/stacks/glance/config/pages`   |
| Widgets  | `/opt/stacks/glance/config/widgets` |

#### :symbols-file-code-corner:&ensp;Docker Compose File

--8<-- "includes/managed_by_dockge.md"

``` yaml { .mono-title title="/opt/stacks/glance/docker-compose.yml" linenums="1" }
--8<-- "glance-compose.yml"
```

1. **Optional:** Mount docker socket _(as 'read-only' for extra security)_ if you want to use the docker containers widget.
2. Use the file, `.env`, to store tokens / secrets and URLs for Widgets. Do **NOT** put API tokens directly into the Glance pages.
3. It is required to define DNS server IP addresses for the container to resolve custom `.internal` FQDN.
4. Specify your timezone.
5. Specify desired track map color
6. **Optional:** "Main" tracks qualifying sessions and races _(inc. sprints)_. "Race" tracks **only** races.
7. Changed the Docker image to **Dynacat**, a fork of Glance with added features.

#### :symbols-file-cog:&ensp;Glance Config File

##### Dynacat

``` yaml { .mono-title title="/opt/stacks/glance/config/dynacat.yml" linenums="1" }
--8<-- "dynacat.yml"
```

1.  The directory, `/app/assets`, contains all of the custom icons and CSS used in the Glance pages.
2.  Assets are cached by the browser, changes to the CSS file will not be reflected until the browser cache is cleared...

    **Refresh & clear cache:**

    - Use the key combination,&ensp;++ctrl+f5++

3.  The Glance Dashboard's server secret is stored in the Bitwarden Vault.

    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }

    - Local Network&ensp;:symbols-move-right:&ensp;"Glance Server Secret"

4.  The directory, `./secrets`, contains the hashed passwords. To change a user's password and generate the hash, enter the container's shell and use the following command:

    ``` sh linenums="1"
    ./glance password:hash <my-password>
    ```

    Then paste the hashed string into the `./secrets/<user>_pw_hash.txt` file.

5.  Values for the colors are in **HSL** format. You can use a **color picker** like [this one](https://colorpicker.dev/#121212){ external-link } to convert colors from other formats.

    :services-it-tools:&ensp;**IT-Tools:**

    - Another service hosted on this local network, [IT-Tools](it-tools.md), also has a great [color converter](http://pi-server.internal:8080/color-converter){ external-link }.  

6.  Used to increase or decrease the contrast of the text. A value of `1.5` means that the text will be 50% **lighter / darker** depending on the scheme.

    Use this if you think that some of the text on the page is too dark and hard to read

##### Glance

``` yaml { .mono-title title="/opt/stacks/glance/config/glance.yml" linenums="1" } 
--8<-- "glance.yml"
```

1.  The directory, `/app/assets`, contains all of the custom icons and CSS used in the Glance pages.
2.  Assets are cached by the browser, changes to the CSS file will not be reflected until the browser cache is cleared...

    **Refresh & clear cache:**

    - Use the key combination,&ensp;++ctrl+f5++

3.  The Glance Dashboard's server secret is stored in the Bitwarden Vault.

    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }

    - Local Network&ensp;:symbols-move-right:&ensp;"Glance Server Secret"

4.  The directory, `./secrets`, contains the hashed passwords. To change a user's password and generate the hash, enter the container's shell and use the following command:

    ``` sh linenums="1"
    ./glance password:hash <my-password>
    ```

    Then paste the hashed string into the `./secrets/<user>_pw_hash.txt` file.

5.  Values for the colors are in **HSL** format. You can use a **color picker** like [this one](https://colorpicker.dev/#121212){ external-link } to convert colors from other formats.

    :services-it-tools:&ensp;**IT-Tools:**

    - Another service hosted on this local network, [IT-Tools](it-tools.md), also has a great [color converter](http://pi-server.internal:8080/color-converter){ external-link }.  

6.  Used to increase or decrease the contrast of the text. A value of `1.5` means that the text will be 50% **lighter / darker** depending on the scheme.

    Use this if you think that some of the text on the page is too dark and hard to read

#### :symbols-layout-dashboard:&ensp;Glance Pages

##### Home

``` yaml { .mono-title title="/opt/stacks/glance/config/pages/home.yml" linenums="1" }
--8<-- "glance-home.yml"
```

1. Show a title header on mobile device web browsers.
2. **Optional:** If you only have a single page you can hide the desktop navigation for a cleaner look.

##### Network

``` yaml { .mono-title title="/opt/stacks/glance/config/pages/network.yml" linenums="1" }
--8<-- "glance-network.yml"
```

1. Show a title header on mobile device web browsers.
2. **Optional:** If you only have a single page you can hide the desktop navigation for a cleaner look.

##### Formula 1

``` yaml { .mono-title title="/opt/stacks/glance/config/pages/formula1.yml" linenums="1" }
--8<-- "glance-formula1.yml"
```

1. Show a title header on mobile device web browsers.
2. **Optional:** If you only have a single page you can hide the desktop navigation for a cleaner look.
