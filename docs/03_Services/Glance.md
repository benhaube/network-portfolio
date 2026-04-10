---
tags:
  - active
  - service
  - software
  - docker
  - dashboard
  - monitor
  - network
hide:
  - toc
---
![[glance.svg|200]]

# [[Glance]]
[GitHub :material-github:](https://github.com/glanceapp/glance){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://github.com/glanceapp/glance/tree/main/docs){ .md-button }

---
## :material-information-outline: Overview
* **Purpose:** A server dashboard Web UI. 
* **Port(s):** `8580`
* **URL / Access:**
    * <https://glance.internal>
    * <http://pi-server.internal:8580/>
* **Credentials:** N/A

## :material-package-down: Deployment Details 
* **Host Device:** &nbsp;:simple-raspberrypi:&nbsp;[[Raspberry_Pi_4B_Server|Raspberry Pi 4B Server]]
* **Method:** &nbsp;:material-docker:&nbsp;Docker Compose
* **Container Name:** `glance`
* **Image:** `glanceapp/glance` 

### :material-cog: Configuration

#### Docker Compose:

```yaml title="docker-compose.yml" linenums="1"
  glance:
    container_name: glance
    image: glanceapp/glance
    restart: unless-stopped
    volumes:
      - ./config:/app/config
      - ./assets:/app/assets
      - /etc/localtime:/etc/localtime:ro 
      - /var/run/docker.sock:/var/run/docker.sock:ro # (1)!
    ports:
      - 8580:8580
    env_file: .env # (2)!
    labels:
      glance.name: Glance
      glance.icon: sh:glance
      glance.url: http://pi-server.internal:8580
      glance.description: Server Dashboard
      glance.id: glance
    dns:
      - 192.168.50.6
      - 192.168.50.2

  f1_api:
    container_name: f1_api
    image: skyallinott/f1_api:latest
    environment:
      - TIMEZONE=America/New_York # (3)!
      - TRACK_COLOUR=#E10600 # (4)!
      - EVENT_DETAIL=main # (5)!
    ports:
      - 4463:4463
    restart: unless-stopped
    dns:
      - 192.168.50.6
      - 192.168.50.2
```

1. Optionally, also mount docker socket if you want to use the docker containers widget
2. Use `.env` to store tokens / secrets and URLs for Widgets. Do **NOT** put API tokens directly into the Glance pages.
3. Specify your timezone.
4. Specify desired track map color
5. Optional. main tracks qualis and races (inc. sprints), race tracks races. 

#### Glance Config:

```yaml title="glance.yml" linenums="1"
server:
  port: 8580
  assets-path: /app/assets # (1)!

# branding:
# app-icon-url: /assets/icons/glance.png
# hide-footer: true

theme:
  # (2)!
  light: true
  background-color: 0 0 95
  primary-color: 0 0 10
  negative-color: 0 90 50

  presets:
    Neon-Pink:
      background-color: 240 27 11
      contrast-multiplier: 1.5
      primary-color: 321 100 71
      positive-color: 165 78 51
      negative-color: 360 100 71
    Catppuccin-Mocha:
      background-color: 240 21 15
      contrast-multiplier: 1.2
      primary-color: 217 92 83
      positive-color: 115 54 76
      negative-color: 347 70 65
    Gruvbox-Dark:
      background-color: 0 0 16
      primary-color: 43 59 81
      positive-color: 61 66 44
      negative-color: 6 96 59
    Formula-One:
      background-color: 0 0 5
      contrast-multiplier: 1.5
      primary-color: 2 100 44
      positive-color: 112 82 46
      negative-color: 2 100 44
    Material-Purple-Enhanced:
      background-color: 227 46 16
      contrast-multiplier: 1.3
      primary-color: 233 76 85
      positive-color: 115 54 76
      negative-color: 347 70 65
    Material-Dark-Forest:
      background-color: 187 100 8
      contrast-multiplier: 1.3
      primary-color: 188 54 83
      positive-color: 115 54 76
      negative-color: 347 70 65

  custom-css-file: /assets/user.css # (3)!

pages:
  - $include: pages/home.yml
  - $include: pages/network.yml
  - $include: pages/formula1.yml
```

1. The `/app/assets` directory contains all of the custom icons and CSS used in the Glance pages.
2. This will be the default theme
3. **Note:** assets are cached by the browser, changes to the CSS file will not be reflected until the browser cache is cleared (Ctrl+F5)

```yaml title="home.yml" linenums="1"
- name: Home
  show-mobile-header: true  # (1)!
  # hide-desktop-navigation: true # (2)
  head-widgets:

    - $include: /app/config/widgets/markets.yml

  columns:

    - size: small
      widgets:

        - $include: /app/config/widgets/nasa-apod.yml
        - $include: /app/config/widgets/random-fact.yml
        - $include: /app/config/widgets/bookmarks.yml

    - size: full
      widgets:

        - $include: /app/config/widgets/search.yml
        - $include: /app/config/widgets/hacker-news-lobsters-split.yml
        - $include: /app/config/widgets/rss-home.yml
        - $include: /app/config/widgets/youtube-home.yml
        - $include: /app/config/widgets/reddit-home.yml

    - size: small
      widgets:

        - $include: /app/config/widgets/clock.yml
        - $include: /app/config/widgets/weather.yml
        - $include: /app/config/widgets/weather-aqi.yml 
        - $include: /app/config/widgets/weather-forecast.yml
        - $include: /app/config/widgets/calendar.yml
        - $include: /app/config/widgets/releases.yml
```

1. Show a title header on mobile web browsers.
2. Optionally, if you only have a single page you can hide the desktop navigation for a cleaner look.

```yaml title="network.yml" linenums="1"
- name: Network
  show-mobile-header: true  # (1)!
  # hide-desktop-navigation: true  # (2)
  columns:

    - size: small
      widgets:

        - $include: /app/config/widgets/beszel.yml
        - $include: /app/config/widgets/uptime-kuma-ssh.yml
        # - $include: /app/config/widgets/wg-easy.yml
        - $include: /app/config/widgets/ha-wan.yml
        - $include: /app/config/widgets/ha-bandwidth.yml
        - $include: /app/config/widgets/releases.yml

    - size: full
      widgets:

        - $include: /app/config/widgets/search.yml
        - $include: /app/config/widgets/network-services.yml
        - $include: /app/config/widgets/docker-containers.yml

        - type: split-column
          widgets:

          - $include: /app/config/widgets/technitium.yml
          - $include: /app/config/widgets/immich-stats.yml

    - size: small
      widgets:

        - $include: /app/config/widgets/clock.yml
        - $include: /app/config/widgets/weather.yml
        - $include: /app/config/widgets/weather-aqi.yml
        - $include: /app/config/widgets/weather-forecast.yml
        - $include: /app/config/widgets/calendar.yml
```

1. Show a title header on mobile web browsers.
2. Optionally, if you only have a single page you can hide the desktop navigation for a cleaner look.

```yaml title="formula1.yml" linenums="1"
- name: Formula 1
  show-mobile-header: true  # (1)!
  # hide-desktop-navigation: true  # (2)
  columns:

    - size: small
      widgets:

        - $include: /app/config/widgets/search.yml
        - $include: /app/config/widgets/f1-last-race-results.yml
        - $include: /app/config/widgets/rss-f1.yml

    - size: full
      widgets:

        - type: split-column
          widgets:

            - $include: /app/config/widgets/f1-next-race.yml
            
            - type: group
              widgets:

                - $include: /app/config/widgets/f1-driver-standings.yml
                - $include: /app/config/widgets/f1-constructor-standings.yml

        - $include: /app/config/widgets/reddit-f1.yml

    - size: small
      widgets:

        - $include: /app/config/widgets/clock.yml
        - $include: /app/config/widgets/weather.yml
        - $include: /app/config/widgets/weather-aqi.yml
        - $include: /app/config/widgets/weather-forecast.yml
        - $include: /app/config/widgets/calendar.yml
```

1. Show a title header on mobile web browsers.
2. Optionally, if you only have a single page you can hide the desktop navigation for a cleaner look.

> [!note] Widgets Directory
> The Glance dashboard widgets have been moved into thier own directory to clean up the page YAML files. The new widgets directory is `/app/config/widgets/`. Using the `$include` directive, the separate widget YAML files can be added to the pages resulting in a much cleaner and easy to manage file structure. Instead of putting every widget on this page you can visit the GitHub repository containing all of the widgets included in these pages. 
> 
> [Glance Widgets :material-github:](https://github.com/benhaube/glance-pages/tree/main/widgets){ .md-button }