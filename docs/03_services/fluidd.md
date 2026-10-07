---
icon: services/fluidd
title: Fluidd
subtitle: The Klipper UI
description: A free and open-source Klipper web interface for managing your 3D-printer.
tags:
  - 3D-Printer
  - Active
  - Native
  - Service
hide:
  - toc
---

![Fluidd Icon](../assets/icons/fluidd.svg){ width=200 }

# Fluidd

_The Klipper UI_

[GitHub&ensp;:brands-github:](https://github.com/fluidd-core/fluidd){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](https://docs.fluidd.xyz/){ .md-button .md-button--primary }

---

![Fluidd homepage](../assets/screenshots/fluidd-home-light.png#only-light){ width=400 align=right .on-glb }
![Fluidd homepage](../assets/screenshots/fluidd-home-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

: A free and open-source Klipper web interface for managing your 3D-printer.

#### :symbols-hash:&ensp;Port(s)

- `80`
{ .no-bullets }
- `4408`
{ .no-bullets }

#### :symbols-link-2:&ensp;URL / Access

- <http://kacey.internal>
{ .no-bullets }
- <https://kacey.rac3r4life.online>
{ .no-bullets }

#### :symbols-user-key:&ensp;Credentials

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }

    - Local Network&ensp;:symbols-move-right:&ensp;"Fluidd (Creality K1C)"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                                             | Method                          | Container Name | Image | Port(s)          |
| :-------------------------------------------------------------------------------------- | :------------------------------ | :------------- | :---- | :--------------- |
| [:symbols-printer-3d-nozzle:&nbsp;Kacey 3D-Printer](../02_hardware/kacey_3d-printer.md) | :symbols-tux:&nbsp;Native Linux | `N/A`          | `N/A` | `80`&ensp;`4408` |

### :symbols-settings:&ensp;Configuration

#### :symbols-monitor-arrow-down-corner:&ensp;Install

Fluidd is installed on the Creality K1C via the [Helper-Script](https://guilouz.github.io/Creality-Helper-Script-Wiki/){ external-link } and requires the Nginx server and Moonraker API to be installed first. Follow the [Fluidd install](https://guilouz.github.io/Creality-Helper-Script-Wiki/helper-script/fluidd-k1/){ external-link } instructions from the Helper-Script documentation.

``` bash title="Setup Creality Helper Script" linenums="1"
--8<-- "install-helper-script.sh"
```

1. Enter the following command to download the Creality-Helper-Script to the `/usr/data/helper-script` directory.
2. Enter this command to run the Creality Helper Script.
3. If you encounter an issue to clone Helper Script repository, enter this command before cloning.

#### :symbols-palette:&ensp;Custom Themes

Fluidd supports custom stylesheets, background images, and logos. All custom theming is configured through a `.fluidd-theme` folder within your printer's configuration directory. Create the `.fluidd-theme` directory by logging into the Fluidd web-UI and navigating to the configuration menu, or by starting an SSH session and using the following command.

``` bash
mkdir -p /usr/data/printer-data/config/.fluidd-theme
```

##### Custom Background

To use a custom background, upload your `background.png` file into the above-mentioned `.fluidd-theme` folder. Currently, the following file extensions are supported:

- `*.jpg`
- `*.jpeg`
- `*.png`
- `*.gif`

##### Custom Logo

To replace the Fluidd logo in the sidebar, upload a `logo.svg` or `logo.png` file to the `.fluidd-theme` folder in your configuration directory. The logo will appear in the application bar after reloading Fluidd.

##### Custom Styling

!!! tip inline end "Custom CSS"

    Custom CSS is applied globally. Fluidd uses [Vuetify 2](https://v2.vuetifyjs.com/en/){ external-link } CSS classes. Use your browser's developer tools _( ++f12++ or ++ctrl+shift+i++ )_ to inspect element classes before writing custom selectors.

To apply custom CSS, create a `custom.css` file and upload it to the `.fluidd-theme` directory. After reloading Fluidd and clearing the cache _(with the keyboard shortcut ++ctrl+f5++ )_ the changes should become visible.

You can find my own custom CSS themes in the GitHub repository. Currently, my themes only affect the dark theme. The standard Fluidd light theme will continue to operate as designed.

[Fluidd Custom CSS&ensp;:brands-github:](https://github.com/benhaube/fluidd-custom-css){ .md-button }
