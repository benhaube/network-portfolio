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
## Overview
* **Purpose:** A server dashboard Web UI. 
* **Port(s):** `8580`
* **URL / Access:**
    * <https://glance.internal>
    * <http://pi-server.internal:8580/>
* **Credentials:** N/A

## Deployment Details 
* **Host Device:** &nbsp;:simple-raspberrypi:&nbsp;[[Raspberry_Pi_4B_Server|Raspberry Pi 4B Server]]
* **Method:** &nbsp;:simple-docker:&nbsp;Docker Compose
* **Container Name:** `glance`
* **Image:** `glanceapp/glance` 

### Configuration

```yaml title="docker-compose.yml" linenums="1"
  glance:
    container_name: glance
    image: glanceapp/glance
    restart: unless-stopped
    volumes:
      - ./config:/app/config
      - ./assets:/app/assets
      - /etc/localtime:/etc/localtime:ro
      # Optionally, also mount docker socket if you want to use the docker containers widget
      - /var/run/docker.sock:/var/run/docker.sock:ro
    ports:
      - 8580:8580
    env_file: .env
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
      - TIMEZONE=America/New_York # Specify your timezone.
      - TRACK_COLOUR=#a6e3a1 # Specify desired track map color
      - EVENT_DETAIL=main # Optional. main tracks qualis and races (inc. sprints), race tracks races. 
    ports:
      - 4463:4463
    restart: unless-stopped
    dns:
      - 192.168.50.6
      - 192.168.50.2
```

**Glance Pages:**

```yaml title="glance.yml" linenums="1"
server:
  port: 8580
  assets-path: /app/assets

# branding:
  # app-icon-url: /assets/icons/glance.png
  # hide-footer: true

theme:
  presets:
    Catppuccin-Mocha:
      background-color: 240 21 15
      contrast-multiplier: 1.2
      primary-color: 217 92 83
      positive-color: 115 54 76
      negative-color: 347 70 65
    Teal-City:
      background-color: 225 14 15
      primary-color: 157 47 65
      contrast-multiplier: 1.1
    Gruvbox-Dark:
      background-color: 0 0 16
      primary-color: 43 59 81
      positive-color: 61 66 44
      negative-color: 6 96 59
    Tucan:
      background-color: 50 1 6
      primary-color: 24 97 58
      negative-color: 209 88 54
    Dracula:
      background-color: 231 15 21
      primary-color: 265 89 79
      contrast-multiplier: 1.2
      positive-color: 135 94 66
      negative-color: 0 100 67
    Material-Navy-Blue:
      background-color: 211 100 12
      contrast-multiplier: 1.0
      primary-color: 221 82 83
      positive-color: 115 54 76
      negative-color: 347 70 65
    Material-Purple-Enhanced:
      background-color: 227 46 16
      contrast-multiplier: 1.0
      primary-color: 233 76 85
      positive-color: 115 54 76
      negative-color: 347 70 65
    Material-Dark-Forest:
      background-color: 187 100 8
      contrast-multiplier: 1.0
      primary-color: 188 54 83
      positive-color: 115 54 76
      negative-color: 347 70 65

  # Note: assets are cached by the browser, changes to the CSS file
  # will not be reflected until the browser cache is cleared (Ctrl+F5)
  custom-css-file: /assets/user.css

pages:
  # It's not necessary to create a new file for each page and include it, you can simply
  # put its contents here, though multiple pages are easier to manage when separated
  - $include: home.yml
  - $include: network.yml
  - $include: formula1.yml
```

```yaml title="home.yml" linenums="1"
- name: Home
  # Show a title header on mobile web browsers
  show-mobile-header: true
  # Optionally, if you only have a single page you can hide the desktop navigation for a cleaner look
  # hide-desktop-navigation: true
  head-widgets:

    - type: markets
      hide-header: true
      markets:
        - symbol: SPY
          name: S&P 500
        - symbol: BTC-USD
          name: Bitcoin
        - symbol: NVDA
          name: NVIDIA
        - symbol: AAPL
          name: Apple
        - symbol: MSFT
          name: Microsoft

  columns:

    - size: small
      widgets:

        - type: custom-api
          title: Random Fact
          cache: 3h
          url: https://uselessfacts.jsph.pl/api/v2/facts/random
          template: |
            <p class="size-h4 color-paragraph">{{ .JSON.String "text" }}</p>

        - type: bookmarks
          groups:
            - title: Bills
              color: 23 100 50
              links:
                - title: BGE
                  url: https://www.bge.com/
                  icon: /assets/icons/exelon-dark.svg
                - title: Discover Bank
                  url: https://www.discover.com/online-banking/
                  icon: /assets/icons/discover.png
                - title: Geico
                  url: https://www.geico.com/
                  icon: /assets/icons/geico.svg
                - title: Resident Services
                  url: https://liveatmillscrossing.securecafenet.com/residentservices/mills-crossing-townhomes-and-apartments/userlogin
                  icon: /assets/icons/rentcafe.png
                - title: Xfinity
                  url: https://www.xfinity.com/overview
                  icon: /assets/icons/xfinity.png
            - title: Email
              color: 46 100 50
              links:
                - title: Fastmail
                  url: https://app.fastmail.com
                  icon: sh:fastmail-light
                - title: Gmail
                  url: https://mail.google.com
                  icon: sh:gmail
                - title: Thundermail
                  url: https://www.thundermail.com/
                  icon: sh:thunderbird
            - title: Entertainment
              color: 9 100 50
              links:
                - title: Pocket Casts
                  url: https://pocketcasts.com/podcasts
                  icon: di:pocket-casts
                - title: YouTube
                  url: https://youtube.com
                  icon: di:youtube
                - title: YouTube Music
                  url: https://music.youtube.com
                  icon: di:youtube-music
            - title: Learning
              color: 305 92 48
              links:
                - title: ACI Learning
                  url: https://app.acilearning.com/
                  icon: /assets/icons/logo-aci-light.png
                - title: CompTIA
                  url: http://comptia.org/
                  icon: /assets/icons/comptia.svg
            - title: Linux
              color: 202 72 73
              links:
                - title: Debian
                  url: https://www.debian.org/
                  icon: sh:debian-light
                - title: Fedora Docs
                  url: https://docs.fedoraproject.org/en-US/docs/
                  icon: sh:fedora-light
                - title: Fedora Project
                  url: https://fedoraproject.org//
                  icon: di:fedora-alt
                - title: Red Hat
                  url: https://www.redhat.com/en
                  icon: di:redhat-linux
            - title: News
              color: 150 74 51
              links:
                - title: 9to5Google
                  url: https://9to5google.com/
                  icon: mdi:clock-time-nine-outline
                - title: Android Faithful
                  url: https://www.androidfaithful.com/
                  icon: di:android
                - title: Google News
                  url: http://news.google.com/
                  icon: di:google-news
                - title: Ground News
                  url: https://ground.news/
                  icon: /assets/icons/gn.svg
                - title: The Baltimore Banner
                  url: http://thebaltimorebanner.com/
                  icon: assets/icons/baltimore-banner.svg
                - title: Wired
                  url: http://wired.com/
                  icon: /assets/icons/wired-square.svg
            - title: Security
              color: 219 81 48
              links:
                - title: Bitwarden
                  url: https://vault.bitwarden.com
                  icon: sh:bitwarden
                - title: Ente Auth
                  url: https://auth.ente.io/credentials
                  icon: https://cdn.jsdelivr.net/gh/selfhst/icons/png/ente-auth.png
                - title: Firefox Relay
                  url: https://relay.firefox.com
                  icon: /assets/icons/firefox-relay.png
                - title: Mozilla Monitor
                  url: https://monitor.mozilla.org
                  icon: sh:mozilla-monitor
                - title: Mozilla VPN
                  url: https://www.mozilla.org/en-US/products/vpn/
                  icon: auto-invert sh:mozilla-vpn
                - title: Ring Dashboard
                  url: https://account.ring.com/account/dashboard
                  icon: si:ring
            - title: Shopping
              color: 37 100 50
              links:
                - title: Amazon
                  url: https://amazon.com
                  icon: di:amazon-light
                - title: Best Buy
                  url: https://bestbuy.com
                  icon: /assets/icons/best-buy.svg
                - title: Curaleaf
                  url: https://curaleaf.com
                  icon: /assets/icons/CURLF-white.svg
                - title: Micro Center
                  url: https://microcenter.com
                  icon: auto-invert sh:micro-center
                  # icon: /assets/icons/micro-center.png
            - title: Social Media
              color: 284 66 40
              links:
                - title: Bluesky
                  url: https://bsky.app
                  icon: di:bluesky
                - title: Mastodon
                  url: https://twit.social
                  icon: di:mastodon
                - title: Patreon
                  url: https://patreon.com
                  icon: di:patreon-light
                - title: Reddit
                  url: https://reddit.com
                  icon: di:reddit
                - title: X-Cancel
                  url: https://xcancel.com/
                  icon: di:twitter
            - title: Software
              color: 210 12 42
              links:
                - title: Docker Hub
                  url: https://hub.docker.com/
                  icon: di:docker
                - title: Flathub
                  url: https://flathub.org/en
                  icon: si:flathub
                - title: Github
                  url: https://github.com/
                  icon: di:github-light
                - title: GitLab
                  url: https://gitlab.com/
                  icon: di:gitlab
                - title: Google Play Store
                  url: http://play.google.com/
                  icon: sh:google-play
            - title: Weather
              color: 22 100 48
              links:
                - title: Accuweather
                  url: https://www.accuweather.com/
                  icon: si:accuweather
                - title: NOAA Storm Prediction Center
                  url: https://www.spc.noaa.gov/
                  icon: mdi:weather-lightning-rainy

    - size: full
      widgets:

        - type: search
          search-engine: duckduckgo
          bangs:
            - title: YouTube
              shortcut: "!yt"
              url: https://www.youtube.com/results?search_query={QUERY}
            - title: Ecosia
              shortcut: "!e"
              url: https://www.ecosia.org/search?method=index&q={QUERY}
            - title: Kagi
              shortcut: "!k"
              url: https://kagi.com/search?q={QUERY}
            - title: Google
              shortcut: "!g"
              url: https://www.google.com/search?q={QUERY}
            - title: Wikipedia
              shortcut: "!wiki"
              url: https://en.wikipedia.org/wiki/Special:Search/{QUERY}

        - type: split-column
          widgets:
            - type: hacker-news
              collapse-after: 3
            - type: lobsters
              collapse-after: 3

        - type: rss
          title: News Feed
          style: detailed-list
          limit: 10
          collapse-after: 3
          # preserve-order: true
          cache: 12h
          feeds:
            - url: https://selfh.st/rss/
              title: selfh.st
            - url: https://androidfaithful.com/rss
              title: Android Faithful
            - url: https://9to5google.com/web-stories/feed/
              title: 9to5Google
            - url: https://www.androidauthority.com/feed
              title: Android Authority
            - url: https://www.wired.com/feed/rss
              title: Wired
            - url: https://fortune.com/feed/fortune-feeds/?id=3230629
              title: Fortune
            - url: https://www.theguardian.com/us/rss
              title: The Guardian

        - type: videos
          title: YouTube
          style: grid-cards
          channels:
            - UCldfgbzNILYZA4dmDt4Cd6A # Secular Talk
            - UCzIO0iX4yKW2P4NkmmKq1PA # 9to5Google
            - UCahJ9IsvXnaQiuNyWQSkrkw # Chris Norlund
            - UCyZVCV9xhrCyz4hPehvb4Wg # Internet Today
            - UCZ5cvDR2HhVUcdVoTvvQKLw # I've Had It
            - UCvhnYODy6WQ0mw_zi3V1h0g # Juan Bagnell
            - UCpa-Zb0ZcQjTCPP1Dx_1M8Q # Legal Eagle
            - UCwpHKudUkP5tNgmMdexB3ow # Mentour Pilot
            - UC7Q4rvzJDbHeBHYk5rnvZeA # The Humanist Report
            - UCxLYtICsUCWdr1YPrj5DtwA # Ordinary Things
            - UCSYCo8uRGF39qDCxF870K5Q # Owen Jones
            - UCFJxE0l3cVYU4kHzi4qVEkw # Rebecca Watson
            - UCR-DXc1voovS8nhAvccRZhg # Jeff Geerling
            - UCHnyfMqiRRG1u-2MsSQLbXA # Veritasium
            - UCgyqtNWZmIxTx3b6OxTSALw # Android Authority
            - UCciQ8wFcVoIIMi-lfu8-cjQ # Anton Petrov
            - UC-9b7aDP6ZN0coj9-xFnrtw # Astrum
            - UCFpy37oq9p1MOVuJbGIcs7Q # Crumb
            - UC4dBHeQ4xfz5zBwaIcmEJfg # Dr. Caelan Conrad
            - UChIs72whgZI9w6d6FhwGGHA # Gamers Nexus
            - UCYvEb6iLPxLPZTe6NcUUUeA # j aubrey
            - UCeDKIj0G5XbultKOQnacu_w # Jose
            - UCxFWzKZa74SyAqpJyVlG5Ew # Kat Blaque
            - UCtPrkXdtCM5DACLufB9jbsA # Mr. Ballen
            - UCb-capTCx4yI3fjZrtDKKEw # Olurinatti
            - UCQSpnDG3YsFNf5-qHocF-WQ # ThioJoe

        - type: group
          widgets:

            - type: reddit
              style: vertical-list
              subreddit: android
              show-flairs: true
              limit: 10
              collapse-after: 5
              show-thumbnails: true

            - type: reddit
              style: vertical-list
              subreddit: fedora
              show-flairs: true
              limit: 10
              collapse-after: 5
              show-thumbnails: true

            - type: reddit
              style: vertical-list
              subreddit: firefox
              show-flairs: true
              limit: 10
              collapse-after: 5
              show-thumbnails: true

            - type: reddit
              style: vertical-list
              subreddit: kde
              show-flairs: true
              limit: 10
              collapse-after: 5
              show-thumbnails: true

            - type: reddit
              style: vertical-list
              subreddit: linux
              show-flairs: true
              limit: 10
              collapse-after: 5
              show-thumbnails: true

            - type: reddit
              style: vertical-list
              subreddit: pihole
              show-flairs: true
              limit: 10
              collapse-after: 5
              show-thumbnails: true

            - type: reddit
              style: vertical-list
              subreddit: whitepeopletwitter
              show-flairs: true
              limit: 10
              collapse-after: 5
              show-thumbnails: true

    - size: small
      widgets:

        - type: clock
          hour-format: 12h

        - type: weather
          title: Weather
          location: Reisterstown, Maryland, United States
          units: imperial # alternatively "metric"
          hour-format: 12h # alternatively "24h"
          # Optionally hide the location from being displayed in the widget
          hide-location: false
          # Optionally show the name of the state or municipality
          show-area-name: true

        - type: custom-api
          title: Air Quality
          cache: 10m
          url: https://api.waqi.info/feed/@8700/?token=7d8557f54bea208aa745eb7105eaeb0aad4d89b8
          template: |
            {{ $aqi := printf "%03s" (.JSON.String "data.aqi") }}
            {{ $aqiraw := .JSON.String "data.aqi" }}
            {{ $updated := .JSON.String "data.time.iso" }}
            {{ $humidity := .JSON.String "data.iaqi.h.v" }}
            {{ $ozone := .JSON.String "data.iaqi.o3.v" }}
            {{ $pm25 := .JSON.String "data.iaqi.pm25.v" }}
            {{ $pressure := .JSON.String "data.iaqi.p.v" }}

            <div class="flex justify-between">
              <div class="size-h5">
                {{ if le $aqi "050" }}
                  <div class="color-positive">Good air quality</div>
                {{ else if le $aqi "100" }}
                  <div class="color-primary">Moderate air quality</div>
                {{ else }}
                  <div class="color-negative">Bad air quality</div>
                {{ end }}
              </div>
            </div>

            <div class="color-highlight size-h2">AQI: {{ $aqiraw }}</div>
            <div style="border-bottom: 1px solid; margin-block: 10px;"></div>

            <div class="margin-block-2">
              <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">

                <div>
                  <div class="size-h3 color-highlight">{{ $humidity }}%</div>
                  <div class="size-h6">HUMIDITY</div>
                </div>

                <div>
                  <div class="size-h3 color-highlight">{{ $ozone }} μg/m³</div>
                  <div class="size-h6">OZONE</div>
                </div>

                <div>
                  <div class="size-h3 color-highlight">{{ $pm25 }} μg/m³</div>
                  <div class="size-h6">PM2.5</div>
                </div>

                <div>
                  <div class="size-h3 color-highlight">{{ $pressure }} hPa</div>
                  <div class="size-h6">PRESSURE</div>
                </div>

                </div>

              <div class="size-h6" style="margin-top: 10px;">Last Updated at {{ slice $updated 11 16 }}</div>
            </div>

        - type: custom-api
          title: Forecast
          body-type: string
          cache: 1h
          options:
            location: ${WEATHER_LOCATION}
            temp_unit: "fahrenheit"
            weekend_color: "#34363D"
            color_clear: "#FFA500"
            color_partly: "#EBE387"
            color_cloud: "#A9A9A9"
            color_smog: "#D3D3D3"
            color_drizzle: "#5F9EA0"
            color_rain: "#4682B4"
            color_freezing_rain: "#B0E0E6"
            color_snow: "#FFFFFF"
            color_thunderstorm: "#696969"
            color_other: "#FFFFFF"
            color_red: "#F08C46"
            color_yellow: "#F0F046"
            color_blue: "#46F0F0"
            color_white: "#FFFFFF"
          template: |
            {{/* THESE VALUES CAN BE CHANGED BY ADDING AN ENTRY TO THE OPTIONS SECTION */}}
              {{ $temp_unit := .Options.StringOr "temp_unit" "celsius" }}
              {{ $weekend_color := .Options.StringOr "weekend_color" "var(--color-separator)" }}
              {{ $overlay_color := .Options.StringOr "overlay_color" "hsl(var(--bghs), var(--bgl), 50%)" }}
              {{/* the following variables define the coloring of the sunny/cloudy/etc. weather icons*/}}
                {{ $color_clear := .Options.StringOr "color_clear" "var(--color-text-highlight)" }}
                {{ $color_partly := .Options.StringOr "color_partly" "var(--color-text-highlight)"}}
                {{ $color_cloud := .Options.StringOr "color_cloud" "var(--color-text-highlight)"}}
                {{ $color_smog := .Options.StringOr "color_smog" "var(--color-text-highlight)"}}
                {{ $color_drizzle := .Options.StringOr "color_drizzle" "var(--color-text-highlight)"}}
                {{ $color_rain := .Options.StringOr "color_rain" "var(--color-text-highlight)"}}
                {{ $color_freezing_rain := .Options.StringOr "color_freezing_rain" "var(--color-text-highlight)"}}
                {{ $color_snow := .Options.StringOr "color_snow" "var(--color-text-highlight)F"}}
                {{ $color_thunderstorm := .Options.StringOr "color_thunderstorm" "var(--color-text-highlight)"}}
                {{ $color_other := .Options.StringOr "color_other" "var(--color-text-highlight)"}}
              {{/* the following variables define the temperature gradient coloring for the daily rectangles */}}
              {{ $color_red := .Options.StringOr "color_red" "var(--color-negative)" }}
              {{ $color_yellow := .Options.StringOr "color_yellow" "var(--color-text-subdue)" }}
              {{ $color_blue := .Options.StringOr "color_blue" "var(--color-positive)" }}
              {{ $color_white := .Options.StringOr "color_white" "var(--color-text-highlight)" }}
              {{ $temp_red := .Options.FloatOr "temp_red" 27 }}
              {{ $temp_yellow := .Options.FloatOr "temp_yellow" 20 }}
              {{ $temp_blue := .Options.FloatOr "temp_blue" 10.0 }}
              {{ $temp_white := .Options.FloatOr "temp_white" 0 }}
              {{ if eq $temp_unit "fahrenheit" }}
                {{ $temp_red = .Options.FloatOr "temp_red" 80.0 }}
                {{ $temp_yellow = .Options.FloatOr "temp_yellow" 70.0 }}
                {{ $temp_blue = .Options.FloatOr "temp_blue" 50.0 }}
                {{ $temp_white = .Options.FloatOr "temp_white" 30.0 }}
              {{end}}

            {{/* Request 1: get latitude and longitude for user's city */}}
            {{ $location_string := replaceAll " " "%20" (.Options.StringOr "location" "") }}
            {{ $url1 := printf "https://geocoding-api.open-meteo.com/v1/search?name=%s&count=20&language=en&format=json" $location_string }}
            {{ $req1 := newRequest $url1 | getResponse }}
            {{ $latitude := $req1.JSON.String "results.0.latitude" }}
            {{ $longitude := $req1.JSON.String "results.0.longitude" }}

            {{/* Request 2: get daily weather forecast based on latitude and longitude */}}
            {{ $url2 := printf "https://api.open-meteo.com/v1/forecast?latitude=%s&longitude=%s&temperature_unit=%s&daily=temperature_2m_max,temperature_2m_min,weathercode&timezone=America/New_York" $latitude $longitude $temp_unit}}
            {{ $req2 := newRequest $url2 | getResponse }}

            <div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">

            {{/* Show abbreivated day of week */}}
              {{ $dates := $req2.JSON.Array "daily.time" }}
              <div style="position: relative; width: 100%; height: 25px;">
                {{ range $index, $date := $dates }}

                  {{/* prepare to print M Tu W Th F Sa Su */}}
                  {{ $dateString := .String "" }}
                  {{ $parsedDate := $dateString | parseTime "DateOnly" }}
                  {{ $dayOfWeek := $parsedDate.Format "Monday" | trimSuffix "day" | trimSuffix "on" | trimSuffix "es" | trimSuffix "edn" |
                      trimSuffix "urs" | trimSuffix "ri" | trimSuffix "tur" | trimSuffix "n" }}

                  {{/* highlight weekends (Sa Su) */}}
                  {{ $day_color := "" }}
                  {{ if eq $dayOfWeek "Sa" "Su" }}
                    {{ $day_color = $weekend_color }}
                  {{ end }}

                  <div style="text-align: center; width: 10%; height: 25px; line-height: 25px; margin: 0 10% 0 3%; left: {{ mul $index 14 }}%; position: absolute; background-color: {{ $day_color | safeCSS }} ">
                    <p class="size-h4 color-paragraph">{{ $dayOfWeek }}</p>
                  </div>
                {{ end }}
              </div>

              {{/* Show numeric day of month */}}
              <div style="position: relative; width: 100%; height: 25px;">
                {{ range $index, $date := $dates }}
                  {{ $dateString := .String "" }}
                  {{ $trimmedDate := replaceMatches "[0-9]+-[0-9]+-" "" $dateString }}
                  <div style="text-align: center; width: 10%; height: 25px; line-height: 25px; margin: 0 10% 0 3%; left: {{ mul $index 14 }}%; position: absolute;">
                    <p class="size-h4 color-paragraph">{{ $trimmedDate }}</p>
                  </div>
                {{ end }}
              </div>

              {{/* Show weather conditions using fontawesome icons */}}
              <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
              {{ $codes := $req2.JSON.Array "daily.weathercode" }}

              <div style="position: relative; width: 100%; height: 30px;">
                {{ range $index, $thiscode := $codes }}
                  {{ $code := .Int "" }}

                  <div style="text-align: center; width: 10%; height: 25px; line-height: 25px; margin: 0 10% 0 3%; left: {{ mul $index 14 }}% ; position: absolute;">
                  {{ $wtype := "" }}
                  {{ $wicon := "" }}
                  {{ $wcolor := "" }}
                  {{ if eq $code 0 }}
                    {{ $wtype = "Clear" }}
                    {{ $wicon = "fas fa-sun" }}
                    {{ $wcolor = $color_clear }}
                  {{ else if eq $code 1 2 }}
                    {{ $wtype = "Part Clear" }}
                    {{ $wicon = "fas fa-cloud-sun" }}
                    {{ $wcolor = $color_partly }}
                  {{ else if eq $code 3 }}
                    {{ $wtype = "Cloudy" }}
                    {{ $wicon = "fas fa-cloud" }}
                    {{ $wcolor = $color_cloud }}
                  {{ else if eq $code 45 48 }}
                    {{ $wtype = "Fog" }}
                    {{ $wicon = "fas fa-smog" }}
                    {{ $wcolor = $color_smog }}
                  {{ else if eq $code 51 53 55 56 57 }}
                    {{ $wtype = "Drizzle" }}
                    {{ $wicon = "fas fa-cloud-rain" }}
                    {{ $wcolor = $color_drizzle }}
                  {{ else if eq $code 61 63 65 80 81 82 }}
                    {{ $wtype = "Rain" }}
                    {{ $wicon = "fas fa-cloud-showers-heavy" }}
                    {{ $wcolor = $color_rain }}
                  {{ else if eq $code 66 67 }}
                    {{ $wtype = "Freezing Rain" }}
                    {{ $wicon = "fas fa-snowflake" }}
                    {{ $wcolor = $color_freezing_rain }}
                  {{ else if eq $code 71 73 75 77 85 86 }}
                    {{ $wtype = "Snow" }}
                    {{ $wicon = "fas fa-snowman" }}
                    {{ $wcolor = $color_snow }}
                  {{ else if eq $code 95 96 99 }}
                    {{ $wtype = "Thunderstorm" }}
                    {{ $wicon = "fas fa-bolt" }}
                    {{ $wcolor = $color_thunderstorm }}
                  {{ else }}
                    {{ $wtype = "Other" }}
                    {{ $wicon = "fa-solid fa-question" }}
                    {{ $wcolor = $color_other }}
                  {{ end }}
                  <i class={{ $wicon }} style="font-size: 20px; color: {{ $wcolor | safeCSS }};", title = {{$wtype }}></i>
                  </div>
                {{ end }}
              </div>
            </div>

            {{/* ===== show daily min and max temperatures ===== */}}
            {{ $maxTemps := $req2.JSON.Array "daily.temperature_2m_max" }}
            {{ $minTemps := $req2.JSON.Array "daily.temperature_2m_min" }}

            {{/* get overall max and min temp over week's range */}}
            {{/* to determine vertical scale */}}
            <div style="display: flex; justify-content: flex-start; align-items: center;">

              {{ $max_max := 0 }}
              {{ range $maxTemps }}
                  {{ if gt (.Int "") $max_max }}
                    {{ $max_max = (.Int "") }}
                  {{ end }}
              {{ end }}
              {{ $min_min := 999 }}
              {{ range $minTemps }}
                  {{ if lt (.Int "") $min_min }}
                    {{ $min_min = (.Int "") }}
                  {{ end }}
              {{ end }}

              {{/* add a small buffer */}}
              {{ $max_max = add $max_max 1 }}
              {{ $min_min = sub $min_min 1 }}

              {{/* outer div to contain the temp chart */}}
              <div style="position: relative; width: 100%; height: 75px;">
                {{/* get relative % heights for each daily max and min */}}
                {{ $temp_range := sub $max_max $min_min }}

                {{ range $index, $thisHigh := $maxTemps }}
                    {{ $thisLow := index $minTemps $index }}
                    {{ $thisHigh = $thisHigh.Float "" }}
                    {{ $thisLow = $thisLow.Float "" }}

                    {{ $thisHighPct := sub 1 (div (sub $max_max $thisHigh) $temp_range) }}
                    {{ $thisLowPct := div (sub $thisLow $min_min) $temp_range }}

                    {{/* define color gradient per. values between $temp_red and $temp_yellow are shown as a color gradient from $color_red to $color_yellow */}}
                    {{/* for colors partially in range, can represent as negative percent */}}
                    {{ $thisTempRange := sub $thisHigh $thisLow }}
                    {{ $red_pos := mul 100 (div (sub $thisHigh $temp_red) $thisTempRange) | toInt }}
                    {{ $yel_pos := mul 100 (div (sub $thisHigh $temp_yellow) $thisTempRange) | toInt }}
                    {{ $blu_pos := mul 100 (div (sub $thisHigh $temp_blue) $thisTempRange) | toInt }}
                    {{ $whi_pos := mul 100 (div (sub $thisHigh $temp_white) $thisTempRange) | toInt }}
                    {{ $gradient_string := printf "%s %d%%, %s %d%%, %s %d%%, %s %d%%" $color_red $red_pos $color_yellow $yel_pos $color_blue $blu_pos $color_white $whi_pos }}

                    {{/* output daily div */}}
                    <div style="left: {{ mul $index 14 | add 3 }}%; bottom: {{ mul $thisLowPct 100 | toInt }}%;
                      height: {{ mul (sub $thisHighPct $thisLowPct) 100 | toInt }}%; position: absolute;
                      background:linear-gradient({{ $gradient_string | safeCSS }}); width: 10%; text-align: center; border-radius: 10px;">

                      {{/* Based on rectangle height & position, print high and low temperatures either inside or outside the rectangle. */}}
                      {{ $top_pos := -2 }}
                      {{ $bot_pos := -2 }}
                      {{ $pos_thresh := 0.20 }}
                      {{ if lt (div $thisTempRange $temp_range) $pos_thresh }}
                        {{ $top_pos = -17 }}
                        {{ $bot_pos = -19 }}
                      {{ else if and (lt (div $thisTempRange $temp_range) (mul $pos_thresh 2)) (lt (sub 1 $thisHighPct) $thisLowPct) }}
                        {{ $bot_pos = -19 }}
                      {{ else if and (lt (div $thisTempRange $temp_range) (mul $pos_thresh 2)) (gt (sub 1 $thisHighPct) $thisLowPct) }}
                        {{ $top_pos = -17 }}
                      {{ end }}
                        <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: {{ $overlay_color | safeCSS }}; z-index: 1;  border-radius: 10px;">
                          <p style='color: #F0F0F0; position: absolute; top: {{ $top_pos }}px; left: 0px; right: 0px'>{{ $thisHigh | toInt }}</p>
                          <p style='color: #F0F0F0; position: absolute; bottom: {{ $bot_pos }}px; left: 0px; right:0px'>{{ $thisLow | toInt }}</p>
                        </div>
                      </div>
                {{ end }}

              </div>
            </div>

        - type: calendar
          first-day-of-week: sunday

        - type: releases
          cache: 1d
          show-source-icon: true
          limit: 50
          collapse-after: 5
          # Without authentication the Github API allows for up to 60 requests per hour. You can create a
          # read-only token from your Github account settings and use it here to increase the limit.
          token: ${GITHUB_TOKEN}
          gitlab-token: ${GITLAB_TOKEN}
          repositories:
            - dockerhub:glanceapp/glance
            - bitfireAT/davx5-ose
            - dockerhub:lovelaze/nebula-sync
            - syncthing/syncthing
            - open-webui/open-webui
            - Martchus/syncthingtray
            - bitwarden/clients
            - SoftFever/OrcaSlicer
            - ente-io/ente
            - localsend/localsend
            - SkyAllinott/glance-F1
            - dockerhub:louislam/uptime-kuma:2
            - yt-dlp/yt-dlp
            - charmbracelet/glow
            - L4ki/Breeze-Chameleon-Icons
            - fastfetch-cli/fastfetch
            - pi-hole/PADD
            - CrealityOfficial/CrealityPrint
            - luisbocanegra/kde-material-you-colors
            - anudeepND/whitelist
            - korkje/mow
            - TheAssassin/AppImageLauncher
            - starship/starship
            - pi-hole/pi-hole
            - pi-hole/web
            - pi-hole/FTL
            - gitlab:CalcProgrammer1/OpenRGB
            - dockerhub:homeassistant/home-assistant:stable
            - dockerhub:corentinth/it-tools
            - dockerhub:portainer/portainer-ce
            - dockerhub:henrygd/beszel:latest
            - dockerhub:henrygd/beszel-agent:latest
            - dockerhub:skyallinott/f1_api:latest
```

```yaml title="network.yml" linenums="1"
# yaml-language-server: $schema=https://raw.githubusercontent.com/not-first/glance-schema/master/schema.json#/definitions/page

- name: Network
  # Show a title header on mobile web browsers
  show-mobile-header: true
  # Optionally, if you only have a single page you can hide the desktop navigation for a cleaner look
  # hide-desktop-navigation: true
  columns:

    - size: small
      widgets:

        - type: custom-api
          title: Server Stats
          cache: 5m
          options:
            base-url: ${BESZEL_URL}
            api-key: ${BESZEL_TOKEN}
          template: |
            {{/* Required config options */}}
            {{ $baseURL := .Options.StringOr "base-url" "" }}
            {{ $apiKey := .Options.StringOr "api-key" "" }}

            {{/* Error message template */}}
            {{ define "errorMsg" }}
              <div class="widget-error-header">
                <div class="color-negative size-h3">ERROR</div>
                <svg class="widget-error-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126ZM12 15.75h.007v.008H12v-.008Z"></path>
                </svg>
              </div>
              <p class="break-all">{{ . }}</p>
            {{ end }}

            {{ define "formatGigabytes" }}
              {{ $value := . }}
              {{ $label := "GB" }}
              {{- if lt $value 1.0 }}
                {{ $value = mul $value 1000.0 }}
                {{ $label = "MB" }}
              {{- else if lt $value 1000.0 }}
              {{ else }}
                {{ $value = div $value 1000.0 }}
                {{ $label = "TB" }}
              {{ end }}
              {{ printf "%.1f" $value }} <span class="color-base size-h5">{{ $label }}</span>
            {{ end }}

            {{/* Check required fields */}}
            {{ if or (eq $baseURL "") (eq $apiKey "") }}
              {{ template "errorMsg" "Some required options are not set." }}
            {{ else }}

              {{ $token := concat "Bearer " $apiKey }}

              {{ $systemsResponse := newRequest (print $baseURL "/api/collections/systems/records")
                  | withHeader "Authorization" $token
                  | getResponse }}
              {{ $systems := $systemsResponse.JSON.Array "items" }}


              {{ range $n, $system := $systems }}
                {{ $status := $system.String "status" }}

                {{ $systemStatsRequest := newRequest (print $baseURL "/api/collections/system_stats/records")
                    | withHeader "Authorization" $token
                    | withParameter "sort" "-created"
                    | withParameter "page" "1"
                    | withParameter "perPage" "1"
                    | withParameter "filter" (print "type='1m'&&system='" ($system.String "id") "'")
                    | getResponse }}
                {{ $systemStats := index ($systemStatsRequest.JSON.Array "items") 0 }}

                {{ $hostname := $system.String "name" }}
                {{ $uptimeSec := $system.Float "info.u" }}

                {{ $systemTemp := $system.Float "info.dt"}}

                {{ $cpuLoad := $system.Float "info.cpu" }}
                {{ $cpuLoad1m := $system.Float "info.l1" }}
                {{ $cpuLoad15m := $system.Float "info.l15" }}

                {{ $memoryUsedPercent := $system.Float "info.mp" }}
                {{ $memoryTotalGb := $systemStats.Float "stats.m" }}
                {{ $memoryUsedGb := $systemStats.Float "stats.mu" }}

                {{ $swapTotalGb := $systemStats.Float "stats.s" }}
                {{ $swapUsedGb := $systemStats.Float "stats.su" }}
                {{ $swapUsedPercent := mul (div $swapUsedGb $swapTotalGb) 100.0 }}

                {{ $rootUsedPercent := $system.Float "info.dp" }}
                {{ $rootTotalGb := $systemStats.Float "stats.d" }}
                {{ $rootUsedGb := $systemStats.Float "stats.du" }}

                <div class="server">
                  <div class="server-info">
                    <div class="server-details">
                      <div class="server-name color-highlight size-h3">{{ $hostname }}</div>
                      <div>
                        {{ if eq $status "up" }}
                          <span>{{ printf "%.1f" (mul $uptimeSec 0.000011574) }}d</span> uptime
                        {{ else }}
                          unreachable
                        {{ end }}
                      </div>
                    </div>
                    <div class="shrink-0"{{ if eq $status "up" }} data-popover-type="html" data-popover-margin="0.2rem" data-popover-max-width="400px"{{ end }}>
                      {{- if eq $status "up" }}
                      <div data-popover-html>
                        <div class="flex">
                          <div class="size-h5 text-compact">Kernel</div>
                          <div class="value-separator"></div>
                          <div class="color-highlight">{{ $system.String "info.k" }}</div>
                        </div>
                        <div class="flex">
                          <div class="size-h5 text-compact">CPU</div>
                          <div class="value-separator"></div>
                          <div class="color-highlight">{{ $system.String "info.m" }}</div>
                        </div>
                      </div>
                      {{- end }}
                      <svg class="server-icon" stroke="var(--color-{{ if eq $status "up" }}positive{{ else }}negative{{ end }})" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M21.75 17.25v-.228a4.5 4.5 0 0 0-.12-1.03l-2.268-9.64a3.375 3.375 0 0 0-3.285-2.602H7.923a3.375 3.375 0 0 0-3.285 2.602l-2.268 9.64a4.5 4.5 0 0 0-.12 1.03v.228m19.5 0a3 3 0 0 1-3 3H5.25a3 3 0 0 1-3-3m19.5 0a3 3 0 0 0-3-3H5.25a3 3 0 0 0-3 3m16.5 0h.008v.008h-.008v-.008Zm-3 0h.008v.008h-.008v-.008Z" />
                      </svg>
                    </div>
                  </div>

                  <div class="server-stats">
                   <div class="flex-1">
                      <div class="flex items-end size-h5">
                        <div>CPU</div>
                        {{- if ge $systemTemp 80.0 }}
                        <svg class="server-spicy-cpu-icon" fill="var(--color-negative)" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" >
                          <path fill-rule="evenodd" d="M8.074.945A4.993 4.993 0 0 0 6 5v.032c.004.6.114 1.176.311 1.709.16.428-.204.91-.61.7a5.023 5.023 0 0 1-1.868-1.677c-.202-.304-.648-.363-.848-.058a6 6 0 1 0 8.017-1.901l-.004-.007a4.98 4.98 0 0 1-2.18-2.574c-.116-.31-.477-.472-.744-.28Zm.78 6.178a3.001 3.001 0 1 1-3.473 4.341c-.205-.365.215-.694.62-.59a4.008 4.008 0 0 0 1.873.03c.288-.065.413-.386.321-.666A3.997 3.997 0 0 1 8 8.999c0-.585.126-1.14.351-1.641a.42.42 0 0 1 .503-.235Z" clip-rule="evenodd" />
                        </svg>
                        {{- end }}
                        <div class="color-highlight margin-left-auto text-very-compact">{{ $cpuLoad }} <span class="color-base">%</span></div>
                      </div>
                      <div data-popover-type="html">
                        <div data-popover-html>
                          <div class="flex">
                            <div class="size-h5">1M AVG</div>
                            <div class="value-separator"></div>
                            <div class="color-highlight text-very-compact">{{ printf "%.1f" $cpuLoad1m }} <span class="color-base size-h5">%</span></div>
                          </div>
                          <div class="flex margin-top-3">
                            <div class="size-h5">15M AVG</div>
                            <div class="value-separator"></div>
                            <div class="color-highlight text-very-compact">{{ printf "%.1f" $cpuLoad15m }} <span class="color-base size-h5">%</span></div>
                          </div>
                         <div class="flex margin-top-3">
                            <div class="size-h5">TEMP C</div>
                            <div class="value-separator"></div>
                            <div class="color-highlight text-very-compact">{{ printf "%.1f" $systemTemp }} <span class="color-base size-h5">°</span></div>
                          </div>
                       </div>

                        <div class="progress-bar progress-bar-combined">
                          <div class="progress-value{{ if ge $cpuLoad1m 85.0 }} progress-value-notice{{ end }}" style="--percent: {{ $cpuLoad1m }}"></div>
                          <div class="progress-value{{ if ge $cpuLoad15m 85.0 }} progress-value-notice{{ end }}" style="--percent: {{ $cpuLoad15m }}"></div>
                        </div>
                      </div>
                    </div>

                    <div class="flex-1">
                      <div class="flex justify-between items-end size-h5">
                        <div>RAM</div>
                        <div class="color-highlight text-very-compact">{{ $memoryUsedPercent }} <span class="color-base">%</span></div>
                      </div>
                      <div data-popover-type="html">
                        <div data-popover-html>
                          <div class="flex">
                            <div class="size-h5">RAM</div>
                            <div class="value-separator"></div>
                            <div class="color-highlight text-very-compact">
                              {{ template "formatGigabytes" $memoryUsedGb }} <span class="color-base size-h5">/</span> {{ template "formatGigabytes" $memoryTotalGb }}
                            </div>
                          </div>
                          {{- if gt $swapTotalGb 0.0 }}
                          <div class="flex margin-top-3">
                            <div class="size-h5">SWAP</div>
                            <div class="value-separator"></div>
                            <div class="color-highlight text-very-compact">
                              {{ template "formatGigabytes" $swapUsedGb }} <span class="color-base size-h5">/</span> {{ template "formatGigabytes" $swapTotalGb }}
                            </div>
                          </div>
                          {{- end }}
                        </div>
                        <div class="progress-bar progress-bar-combined">
                          <div class="progress-value{{ if ge $memoryUsedPercent 85.0 }} progress-value-notice{{ end }}" style="--percent: {{ $memoryUsedPercent }}"></div>
                          {{- if gt $swapTotalGb 0.0 }}
                          <div class="progress-value{{ if ge $swapUsedPercent 85.0 }} progress-value-notice{{ end }}" style="--percent: {{ $swapUsedPercent }}"></div>
                          {{- end }}
                        </div>
                      </div>
                    </div>

                    <div class="flex-1">
                      <div class="flex justify-between items-end size-h5">
                        <div>DISK</div>
                        <div class="color-highlight text-very-compact">{{ $rootUsedPercent }} <span class="color-base">%</span></div>
                      </div>
                      <div data-popover-type="html">
                        <div data-popover-html>
                          <ul class="list list-gap-2">
                            <li class="flex">
                              <div class="size-h5">/</div>
                              <div class="value-separator"></div>
                              <div class="color-highlight text-very-compact">
                                {{ template "formatGigabytes" $rootUsedGb }} <span class="color-base size-h5">/</span> {{ template "formatGigabytes" $rootTotalGb }}
                              </div>
                            </li>
                            {{ range $key, $efs := ($systemStats.Get "stats.efs").Map }}
                              <li class="flex">
                                <div class="size-h5">{{ $key }}</div>
                                <div class="value-separator"></div>
                                <div class="color-highlight text-very-compact">
                                  {{ template "formatGigabytes" (($efs.Get "du").Float) }} <span class="color-base size-h5">/</span> {{ template "formatGigabytes" (($efs.Get "d").Float) }}
                                </div>
                              </li>
                            {{ end }}
                          </ul>
                        </div>
                        <div class="progress-bar progress-bar-combined">
                          <div class="progress-value{{ if ge $rootUsedPercent 85.0 }} progress-value-notice{{ end }}" style="--percent: {{ $rootUsedPercent }}"></div>
                         {{ range $key, $efs := ($systemStats.Get "stats.efs").Map }}
                            {{ $efsTotalGb := (($efs.Get "d").Float) }}
                            {{ $efsUsedGb := (($efs.Get "du").Float) }}
                            {{ $efsPercent := mul (div $efsUsedGb $efsTotalGb) 100 }}
                            <div class="progress-value{{ if ge $efsPercent 85.0 }} progress-value-notice{{ end }}" style="--percent: {{ $efsPercent }}"></div>
                          {{ end }}
                        </div>
                      </div>
                    </div>

                  </div>
                </div>
              {{ end }}
            {{ end }}

        # - type: dns-stats
          # title: DNS (backup) @ pi-hole
          # service: pihole-v6
          # url: https://192.168.50.3
          # password: 1g9+XpHVhq8pIpQjy+FEa/GiC62+BUEu6+ePEUhlTS8=
          # allow-insecure: true

        - type: custom-api
          title: WAN
          cache: 10m
          url: ${HASS_URL}/api/states
          headers:
            Authorization: "Bearer ${HASS_API_KEY}"
            Content-Type: "application/json"
          template: |
            {{ if eq .Response.StatusCode 200 }}
              <div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 8px;">
                {{ range .JSON.Array "" }}
                  {{ $id := .String "entity_id" }}
                  {{ $state := .String "state" }}
                  {{ if and (or
                                (eq $id "sensor.rt_be92u_faf0_wan_status")
                                (eq $id "sensor.rt_be92u_faf0_external_ip")
                                (eq $id "sensor.router_uptime_rounded")
                                (eq $id "sensor.connected_devices")
                            )
                            (ne $state "unavailable")
                            (ne $state "unknown")
                  }}
                    <div class="background-faint radius-8" style="padding: 6px 10px; text-align: center;">
                      <div class="color-highlight size-h3" style="line-height: 1.2;">
                        {{ $state }}{{ .String "attributes.unit_of_measurement" }}
                      </div>
                      <div class="size-h6 color-subdue" style="line-height: 1.2;">
                        {{ .String "attributes.friendly_name" }}
                      </div>
                    </div>
                  {{ end }}
                {{ end }}
              </div>
            {{ else }}
              <div style="text-align: center;" class="color-negative size-h4">
                Error: {{ .Response.StatusCode }} – {{ .Response.Status }}
              </div>
            {{ end }}

        - type: custom-api
          title: Bandwidth
          cache: 10m
          url: ${HASS_URL}/api/states
          headers:
            Authorization: "Bearer ${HASS_API_KEY}"
            Content-Type: "application/json"
          template: |
            {{ if eq .Response.StatusCode 200 }}
              <div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 8px;">
                {{ range .JSON.Array "" }}
                  {{ $id := .String "entity_id" }}
                  {{ $state := .String "state" }}
                  {{ if and (or
                                (eq $id "sensor.data_sent_3")
                                (eq $id "sensor.upload_speed_2")
                                (eq $id "sensor.download_speed_2")
                                (eq $id "sensor.data_recieved_3")
                            )
                            (ne $state "unavailable")
                            (ne $state "unknown")
                  }}
                    <div class="background-faint radius-8" style="padding: 6px 10px; text-align: center;">
                      <div class="color-highlight size-h3" style="line-height: 1.2;">
                        {{ $state }}{{ .String "attributes.unit_of_measurement" }}
                      </div>
                      <div class="size-h6 color-subdue" style="line-height: 1.2;">
                        {{ .String "attributes.friendly_name" }}
                      </div>
                    </div>
                  {{ end }}
                {{ end }}
              </div>
            {{ else }}
              <div style="text-align: center;" class="color-negative size-h4">
                Error: {{ .Response.StatusCode }} – {{ .Response.Status }}
              </div>
            {{ end }}

        - type: releases
          cache: 1d
          show-source-icon: true
          limit: 50
          collapse-after: 5
          # Without authentication the Github API allows for up to 60 requests per hour. You can create a
          # read-only token from your Github account settings and use it here to increase the limit.
          token: ${GITHUB_TOKEN}
          gitlab-token: ${GITLAB_TOKEN}
          repositories:
            - dockerhub:glanceapp/glance
            - bitfireAT/davx5-ose
            - dockerhub:lovelaze/nebula-sync
            - syncthing/syncthing
            - open-webui/open-webui
            - Martchus/syncthingtray
            - bitwarden/clients
            - SoftFever/OrcaSlicer
            - ente-io/ente
            - localsend/localsend
            - SkyAllinott/glance-F1
            - dockerhub:louislam/uptime-kuma:2
            - yt-dlp/yt-dlp
            - charmbracelet/glow
            - L4ki/Breeze-Chameleon-Icons
            - fastfetch-cli/fastfetch
            - pi-hole/PADD
            - CrealityOfficial/CrealityPrint
            - luisbocanegra/kde-material-you-colors
            - anudeepND/whitelist
            - korkje/mow
            - TheAssassin/AppImageLauncher
            - starship/starship
            # - pi-hole/pi-hole
            # - pi-hole/web
            # - pi-hole/FTL
            - gitlab:CalcProgrammer1/OpenRGB
            - dockerhub:homeassistant/home-assistant:stable
            - dockerhub:corentinth/it-tools
            - dockerhub:portainer/portainer-ce
            - dockerhub:henrygd/beszel:latest
            - dockerhub:henrygd/beszel-agent:latest
            - dockerhub:skyallinott/f1_api:latest

    - size: full
      widgets:

        - type: search
          search-engine: duckduckgo
          bangs:
            - title: YouTube
              shortcut: "!yt"
              url: https://www.youtube.com/results?search_query={QUERY}
            - title: Ecosia
              shortcut: "!e"
              url: https://www.ecosia.org/search?method=index&q={QUERY}
            - title: Kagi
              shortcut: "!k"
              url: https://kagi.com/search?q={QUERY}
            - title: Google
              shortcut: "!g"
              url: https://www.google.com/search?q={QUERY}
            - title: Wikipedia
              shortcut: "!wiki"
              url: https://en.wikipedia.org/wiki/Special:Search/{QUERY}

        - type: monitor
          cache: 1m
          title: Local Network Services
          sites:
            - title: ASUS RT-BE92U
              url: https://asusrouter.internal:8443
              icon: di:asus-router
              allow-insecure: true
            - title: F1 Replay Timing
              url: http://storage-server.internal:3000
              icon: /assets/icons/f1-replay-timing.svg
            - title: Files (storage-server)
              url: http://storage-server.internal/modules/icewhale_files/
              icon: assets/icons/files.svg
            # - title: Glances (pi-hole)
              # url: http://pi-hole.internal:61208/
              # icon: sh:glances
            - title: Glances (storage-server)
              url: http://storage-server.internal:61208/
              icon: sh:glances
            - title: Homebox
              url: http://storage-server.internal:3100/home
              icon: sh:homebox
            - title: Immich
              url: http://storage-server.internal:2283
              icon: sh:immich
            - title: Kacey (3D Printer)
              url: http://k1c-a71e.internal
              icon: /assets/icons/creality-v2.svg
            # - title: Mermaid Live Editor
              # url: http://storage-server.internal:8000
              # icon: https://avatars.githubusercontent.com/u/57169982?s=48&v=4
            - title: Openprinting CUPS Server
              url: https://192.168.50.2:631/
              allow-insecure: true
              icon: sh:openprinting-cups
            - title: OpenSpeedTest
              url: http://storage-server.internal:3004/
              icon: sh:openspeedtest
            # - title: Pi-Hole DNS
              # url: https://pi-hole.internal/admin
              # allow-insecure: true
              # icon: sh:pi-hole
            - title: Portracker
              url: http://storage-server.internal:4999
              icon: sh:portracker-light
            - title: Spoolman
              url: http://storage-server.internal:7912
              icon: sh:spoolman
            - title: Technitium DNS
              url: http://debian-vm.internal:5380
              icon: sh:technitium
            - title: WireGuard Easy
              url: http://storage-server.internal:51821/
              icon: /assets/icons/wireguard-rounded-square.svg
            - title: yt-dlp Web UI
              url: http://storage-server.internal:3033/
              icon: di:yt-dlp
            - title: ZimaOS NAS
              url: http://storage-server.internal
              allow-insecure: true
              icon: di:zima-os.png
            - title: ZVM (storage-server)
              url: http://storage-server.internal/modules/zimaos_zvm/
              icon: /assets/icons/zvm.svg

        - type: docker-containers
          title: Docker Containers (pi-server)
          hide-by-default: false
          containers:
            beszel:
              name: Beszel Hub
              description: Lightweight server monitoring platform
              url: http://pi-server.internal:8090/
              id: beszel
              icon: sh:beszel
            beszel-agent:
              name: Beszel Agent
              description: Lightweight agent for the Beszel monitoring platform
              parent: beszel
            dockge-dockge-1:
              name: Dockge
              description: A fancy, easy-to-use and reactive self-hosted docker compose.yaml stack-oriented manager
              url: http://pi-server.internal:5001
              icon: sh:dockge
            f1_api:
              name: F1_API
              description: An API for Formula 1 stats
              parent: glance
              icon: /assets/icons/f1.svg
            glances-glances-1:
              name: Glances
              description: Glances an Eye on your system
              url: http://pi-server.internal:61208
              icon: sh:glances
            homeassistant:
              name: Home Assistant
              description: Smarthome control panel
              url: http://pi-server.internal:8123
              icon: sh:home-assistant
              # hide: false
            it-tools:
              name: IT-Tools
              description: Handy tools for developers
              url: http://pi-server.internal:8080
              icon: di:it-tools-light
              id: it-tools
              # hide: false
            nebula-sync:
              name: Nebula-Sync
              description: Synchronize Pi-hole configuration
              icon: /assets/icons/pi-hole2.svg
            portainer:
              name: Portainer
              id: portainer-ee
              description: Container management platform
              url: https://pi-server.internal:9443
              icon: sh:portainer-pink
            portainer_agent:
              name: Portainer-Agent
              parent: portainer-ee
            portracker:
              name: Portracker
              icon: sh:portracker-light
            uptime-kuma:
              name: Uptime-Kuma
              description: Network service monitoring tool
              url: http://pi-server.internal:3001
              icon: sh:uptime-kuma
            ws-tcp-udp-bridge:
              name: ws-tcp-udp-bridge
              parent: it-tools

        - type: split-column
          widgets:

          - type: custom-api
            title: Technitium DNS Stats
            cache: 1h
            subrequests:
              update-check:
                url: http://${TECHNITIUM_IP_PORT}/api/user/checkForUpdate?token=${TECHNITIUM_TOKEN}
            url: http://${TECHNITIUM_IP_PORT}/api/dashboard/stats/get?token=${TECHNITIUM_TOKEN}&type=${TECHNITIUM_STATS_TIMEFRAME}&utc=true
            method: GET
            template: |
              <ul class="list list-gap-10 collapsible-container" data-collapse-after="3">
              {{ $updateCheck := .Subrequest "update-check" }}
                  <li>
                  <strong class="color-highlight">Version:</strong>
                  {{ $updateCheck.JSON.String "response.currentVersion" }}
                  {{ if ($updateCheck.JSON.Bool "response.updateAvailable") }}
                  <a href="https://github.com/TechnitiumSoftware/DnsServer/blob/master/CHANGELOG.md"><strong><span class="color-positive"> Update Available: {{ $updateCheck.response.updateVersion }}</span></strong></a>
                  {{ end }}
                  </li>
                  <li>
                  <strong class="color-highlight">Total Queries:</strong>
                  {{ .JSON.String "response.stats.totalQueries" }}
                  </li>
                  <li>
                  <strong class="color-highlight">Blocked Queries:</strong>
                  {{ .JSON.String "response.stats.totalBlocked" }}
                  </li>
                  <li>
                  <!-- Top Clients Table -->
                  <h4 class="size-h5 color-highlight">Top Clients</h4>
                  <table style="width: 100%; border-collapse: collapse; margin-bottom: 20px;">
                      <thead>
                      <tr style="border-bottom: 1px solid #ccc;">
                          <th style="text-align: left; padding: 8px;">Name</th>
                          <th style="text-align: left; padding: 8px;">Domain</th>
                          <th style="text-align: left; padding: 8px;">Hits</th>
                          <th style="text-align: left; padding: 8px;">Rate Limited</th>
                      </tr>
                      </thead>
                      <tbody>
                      {{ range $index, $client := .JSON.Array "response.topClients" }}
                          <tr>
                          <td style="padding: 8px;">{{ $client.String "name" }}</td>
                          <td style="padding: 8px;">{{ $client.String "domain" }}</td>
                          <td style="padding: 8px;">{{ $client.String "hits" }}</td>
                          <td style="padding: 8px;">
                              {{ if $client.Bool "rateLimited" }}Yes{{ else }}No{{ end }}
                          </td>
                          </tr>
                      {{ end }}
                      </tbody>
                  </table>
                  </li>
                  <li>
                  <!-- Top Domains Table -->
                  <h4 class="size-h5 color-highlight">Top Domains</h4>
                  <table style="width: 100%; border-collapse: collapse; margin-bottom: 20px;">
                      <thead>
                      <tr style="border-bottom: 1px solid #ccc;">
                          <th style="text-align: left; padding: 8px;">Domain</th>
                          <th style="text-align: left; padding: 8px;">Hits</th>
                      </tr>
                      </thead>
                      <tbody>
                      {{ range $index, $domain := .JSON.Array "response.topDomains" }}
                          <tr>
                          <td style="padding: 8px;">{{ $domain.String "name" }}</td>
                          <td style="padding: 8px;">{{ $domain.String "hits" }}</td>
                          </tr>
                      {{ end }}
                      </tbody>
                  </table>
                  </li>
                  <li>
                  <!-- Top Blocked Domains Table -->
                  <h4 class="size-h5 color-highlight">Top Blocked Domains</h4>
                  <table style="width: 100%; border-collapse: collapse;">
                      <thead>
                      <tr style="border-bottom: 1px solid #ccc;">
                          <th style="text-align: left; padding: 8px;">Domain</th>
                          <th style="text-align: left; padding: 8px;">Hits</th>
                      </tr>
                      </thead>
                      <tbody>
                      {{ range $index, $blocked := .JSON.Array "response.topBlockedDomains" }}
                          <tr>
                          <td style="padding: 8px;">{{ $blocked.String "name" }}</td>
                          <td style="padding: 8px;">{{ $blocked.String "hits" }}</td>
                          </tr>
                      {{ end }}
                      </tbody>
                  </table>
                  </li>
              </ul>

          - type: custom-api
            title: Immich Stats
            hide-header: false
            cache: 10m
            url: ${IMMICH_URL}/api/server/statistics
            headers:
              x-api-key: ${IMMICH_KEY}
            subrequests:
              storage:
                url: ${IMMICH_URL}/api/server/storage
                headers:
                    x-api-key: ${IMMICH_KEY}
            options:
              show-cards: true
              show-storage-bar: true
            template: |
              {{ $photos := .JSON.Int "photos" }}
              {{ $videos := .JSON.Int "videos" }}
              {{ $usageBytes := .JSON.Int "usage" }}
              {{ $usageGiB := div (toFloat $usageBytes) 1073741824.0 }}
              {{ $storage := .Subrequest "storage" }}
              {{ $storage_ok := and (ge $storage.Response.StatusCode 200) (le $storage.Response.StatusCode 299) }}
              {{ $totalGiB := 0.0 }}
              {{ $percentage := 0.0 }}
              {{ $storageError := "" }}
              {{ if $storage_ok }}
                {{ $totalGiB = div (toFloat ($storage.JSON.Int "diskSizeRaw")) 1073741824.0 }}
                {{ $percentage = $storage.JSON.Float "diskUsagePercentage" }}
              {{ else }}
                {{ $storageError = printf "%d %s" $storage.Response.StatusCode $storage.Response.Status }}
              {{ end }}
              {{ $showCards := .Options.BoolOr "show-cards" true }}
              {{ $showStorageBar := .Options.BoolOr "show-storage-bar" true }}

              {{ if $showCards }}
              <div style="display: flex; gap: 16px; flex-wrap: wrap;{{ if $showStorageBar }} margin-bottom: 16px;{{ end }}">
                <!-- Photos Card -->
                <div style="display: flex; flex-direction: column; justify-content: space-between; background-color: var(--color-widget-background-highlight); border-radius: 12px; padding: 20px; flex: 1; min-width: 200px;">
                  <div style="display: flex; align-items: center; gap: 12px; margin-bottom: 16px;">
                    <svg style="width: 40px; height: 40px; color: var(--color-primary); flex-shrink: 0;" viewBox="0 0 24 24" fill="currentColor">
                      <path d="M13.73,15L9.83,21.76C10.53,21.91 11.25,22 12,22C14.4,22 16.6,21.15 18.32,19.75L14.66,13.4M2.46,15C3.38,17.92 5.61,20.26 8.45,21.34L12.12,15M8.54,12L4.64,5.25C3,7 2,9.39 2,12C2,12.68 2.07,13.35 2.2,14H9.69M21.8,10H14.31L14.6,10.5L19.36,18.75C21,16.97 22,14.6 22,12C22,11.31 21.93,10.64 21.8,10M21.54,9C20.62,6.07 18.39,3.74 15.55,2.66L11.88,9M9.4,10.5L14.17,2.24C13.47,2.09 12.75,2 12,2C9.6,2 7.4,2.84 5.68,4.25L9.34,10.6L9.4,10.5Z"/>
                    </svg>
                    <span style="font-weight: 600; font-size: 1.8rem; text-transform: uppercase; letter-spacing: 0.5px; color: var(--color-text-highlight);">Photos</span>
                  </div>
                  <div style="font-family: ui-monospace, monospace; font-size: 1.85rem; font-weight: 700; color: var(--color-text-highlight); word-break: break-all;">
                    {{ if lt $photos 10 }}<span style="color: var(--color-text-subdue); font-weight: 400; opacity: 0.6;">000000000</span>{{ else if lt $photos 100 }}<span style="color: var(--color-text-subdue); font-weight: 400; opacity: 0.6;">00000000</span>{{ else if lt $photos 1000 }}<span style="color: var(--color-text-subdue); font-weight: 400; opacity: 0.6;">0000000</span>{{ else if lt $photos 10000 }}<span style="color: var(--color-text-subdue); font-weight: 400; opacity: 0.6;">000000</span>{{ else if lt $photos 100000 }}<span style="color: var(--color-text-subdue); font-weight: 400; opacity: 0.6;">00000</span>{{ else if lt $photos 1000000 }}<span style="color: var(--color-text-subdue); font-weight: 400; opacity: 0.6;">0000</span>{{ end }}{{ $photos }}
                  </div>
                </div>

                <!-- Videos Card -->
                <div style="display: flex; flex-direction: column; justify-content: space-between; background-color: var(--color-widget-background-highlight); border-radius: 12px; padding: 20px; flex: 1; min-width: 200px;">
                  <div style="display: flex; align-items: center; gap: 12px; margin-bottom: 16px;">
                    <svg style="width: 40px; height: 40px; color: var(--color-primary); flex-shrink: 0;" viewBox="0 0 24 24" fill="currentColor">
                      <path d="M10,16.5V7.5L16,12M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z"/>
                    </svg>
                    <span style="font-weight: 600; font-size: 1.8rem; text-transform: uppercase; letter-spacing: 0.5px; color: var(--color-text-highlight);">Videos</span>
                  </div>
                  <div style="font-family: ui-monospace, monospace; font-size: 1.85rem; font-weight: 700; color: var(--color-text-highlight); word-break: break-all;">
                    {{ if lt $videos 10 }}<span style="color: var(--color-text-subdue); font-weight: 400; opacity: 0.6;">000000000</span>{{ else if lt $videos 100 }}<span style="color: var(--color-text-subdue); font-weight: 400; opacity: 0.6;">00000000</span>{{ else if lt $videos 1000 }}<span style="color: var(--color-text-subdue); font-weight: 400; opacity: 0.6;">0000000</span>{{ else if lt $videos 10000 }}<span style="color: var(--color-text-subdue); font-weight: 400; opacity: 0.6;">000000</span>{{ else if lt $videos 100000 }}<span style="color: var(--color-text-subdue); font-weight: 400; opacity: 0.6;">00000</span>{{ else if lt $videos 1000000 }}<span style="color: var(--color-text-subdue); font-weight: 400; opacity: 0.6;">0000</span>{{ end }}{{ $videos }}
                  </div>
                </div>

                <!-- Storage GiB Card -->
                <div style="display: flex; flex-direction: column; justify-content: space-between; background-color: var(--color-widget-background-highlight); border-radius: 12px; padding: 20px; flex: 1; min-width: 200px;">
                  <div style="display: flex; align-items: center; gap: 12px; margin-bottom: 16px;">
                    <svg style="width: 40px; height: 40px; color: var(--color-primary); flex-shrink: 0;" viewBox="0 0 24 24" fill="currentColor">
                      <path d="M11,2V22C5.9,21.5 2,17.2 2,12C2,6.8 5.9,2.5 11,2M13,2V11H22C21.5,6.2 17.8,2.5 13,2M13,13V22C17.7,21.5 21.5,17.8 22,13H13Z"/>
                    </svg>
                    <span style="font-weight: 600; font-size: 1.8rem; text-transform: uppercase; letter-spacing: 0.5px; color: var(--color-text-highlight);">Storage</span>
                  </div>
                <div style="font-family: ui-monospace, monospace; font-size: 1.85rem; font-weight: 700; color: var(--color-text-highlight); word-break: break-all;">
                  {{ $gib := printf "%.0f" $usageGiB }}
                  {{ if lt $usageGiB 10.0 }}<span style="color: var(--color-text-subdue); font-weight: 400; opacity: 0.6;">000000000</span>{{ else if lt $usageGiB 100.0 }}<span style="color: var(--color-text-subdue); font-weight: 400; opacity: 0.6;">00000000</span>{{ else if lt $usageGiB 1000.0 }}<span style="color: var(--color-text-subdue); font-weight: 400; opacity: 0.6;">0000000</span>{{ end }}{{ $gib }}<span style="font-size: 1.5rem; font-weight: 500; color: var(--color-text-subdue); margin-left: 8px;">GiB</span>
                </div>
                </div>
              </div>
                {{ end }}

                {{ if $showStorageBar }}
                <!-- Progress Bar Section -->
                <div style="background-color: var(--color-widget-background-highlight); border-radius: 12px; padding: 20px;">
                  <div style="font-weight: 600; color: var(--color-text-highlight); margin-bottom: 8px; font-size: 1.6rem;">Storage space</div>
                  {{ if gt $totalGiB 0.0 }}
                    <div style="color: var(--color-text-highlight); font-size: 1.4rem; margin-bottom: 12px; font-weight: 500;">{{ printf "%.1f" $usageGiB }} GiB of {{ printf "%.1f" $totalGiB }} GiB used</div>
                    <div style="color: var(--color-text-subdue); font-size: 1.35rem; margin-bottom: 12px;">{{ printf "%.1f" $percentage }}% full</div>
                  {{ else }}
                    <div style="color: var(--color-text-highlight); font-size: 1.4rem; margin-bottom: 12px; font-weight: 500;">{{ printf "%.1f" $usageGiB }} GiB used</div>
                    <div style="color: var(--color-text-negative); font-size: 1.35rem; margin-bottom: 12px;">Total storage unavailable ({{ $storageError }}). Ensure API key has permissions for /api/server/storage.</div>
                  {{ end }}
                  <div style="height: 12px; width: 100%; background-color: var(--color-text-subdue); border-radius: 6px; overflow: hidden; opacity: 0.2;">
                    <div style="height: 100%; background-color: var(--color-primary); border-radius: 6px; transition: width 0.3s ease; width: {{ if gt $totalGiB 0.0 }}{{ printf "%.1f" $percentage }}%{{ else }}0%{{ end }};"></div>
                  </div>
                </div>
                {{ end }}

    - size: small
      widgets:

        - type: clock
          hour-format: 12h

        - type: weather
          location: Reisterstown, Maryland, United States
          units: imperial # alternatively "imperial"
          hour-format: 12h # alternatively "24h"
          # Optionally hide the location from being displayed in the widget
          hide-location: false
          # Optionally show the name of the state or municipality
          show-area-name: true

        - type: custom-api
          title: Air Quality
          cache: 10m
          url: https://api.waqi.info/feed/@8700/?token=7d8557f54bea208aa745eb7105eaeb0aad4d89b8
          template: |
            {{ $aqi := printf "%03s" (.JSON.String "data.aqi") }}
            {{ $aqiraw := .JSON.String "data.aqi" }}
            {{ $updated := .JSON.String "data.time.iso" }}
            {{ $humidity := .JSON.String "data.iaqi.h.v" }}
            {{ $ozone := .JSON.String "data.iaqi.o3.v" }}
            {{ $pm25 := .JSON.String "data.iaqi.pm25.v" }}
            {{ $pressure := .JSON.String "data.iaqi.p.v" }}

            <div class="flex justify-between">
              <div class="size-h5">
                {{ if le $aqi "050" }}
                  <div class="color-positive">Good air quality</div>
                {{ else if le $aqi "100" }}
                  <div class="color-primary">Moderate air quality</div>
                {{ else }}
                  <div class="color-negative">Bad air quality</div>
                {{ end }}
              </div>
            </div>

            <div class="color-highlight size-h2">AQI: {{ $aqiraw }}</div>
            <div style="border-bottom: 1px solid; margin-block: 10px;"></div>

            <div class="margin-block-2">
              <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">

                <div>
                  <div class="size-h3 color-highlight">{{ $humidity }}%</div>
                  <div class="size-h6">HUMIDITY</div>
                </div>

                <div>
                  <div class="size-h3 color-highlight">{{ $ozone }} μg/m³</div>
                  <div class="size-h6">OZONE</div>
                </div>

                <div>
                  <div class="size-h3 color-highlight">{{ $pm25 }} μg/m³</div>
                  <div class="size-h6">PM2.5</div>
                </div>

                <div>
                  <div class="size-h3 color-highlight">{{ $pressure }} hPa</div>
                  <div class="size-h6">PRESSURE</div>
                </div>

                </div>

              <div class="size-h6" style="margin-top: 10px;">Last Updated at {{ slice $updated 11 16 }}</div>
            </div>

        - type: custom-api
          title: Forecast
          body-type: string
          cache: 1h
          options:
            location: ${WEATHER_LOCATION}
            temp_unit: "fahrenheit"
            weekend_color: "#34363D"
            color_clear: "#FFA500"
            color_partly: "#EBE387"
            color_cloud: "#A9A9A9"
            color_smog: "#D3D3D3"
            color_drizzle: "#5F9EA0"
            color_rain: "#4682B4"
            color_freezing_rain: "#B0E0E6"
            color_snow: "#FFFFFF"
            color_thunderstorm: "#696969"
            color_other: "#FFFFFF"
            color_red: "#F08C46"
            color_yellow: "#F0F046"
            color_blue: "#46F0F0"
            color_white: "#FFFFFF"
          template: |
            {{/* THESE VALUES CAN BE CHANGED BY ADDING AN ENTRY TO THE OPTIONS SECTION */}}
              {{ $temp_unit := .Options.StringOr "temp_unit" "celsius" }}
              {{ $weekend_color := .Options.StringOr "weekend_color" "var(--color-separator)" }}
              {{ $overlay_color := .Options.StringOr "overlay_color" "hsl(var(--bghs), var(--bgl), 50%)" }}
              {{/* the following variables define the coloring of the sunny/cloudy/etc. weather icons*/}}
                {{ $color_clear := .Options.StringOr "color_clear" "var(--color-text-highlight)" }}
                {{ $color_partly := .Options.StringOr "color_partly" "var(--color-text-highlight)"}}
                {{ $color_cloud := .Options.StringOr "color_cloud" "var(--color-text-highlight)"}}
                {{ $color_smog := .Options.StringOr "color_smog" "var(--color-text-highlight)"}}
                {{ $color_drizzle := .Options.StringOr "color_drizzle" "var(--color-text-highlight)"}}
                {{ $color_rain := .Options.StringOr "color_rain" "var(--color-text-highlight)"}}
                {{ $color_freezing_rain := .Options.StringOr "color_freezing_rain" "var(--color-text-highlight)"}}
                {{ $color_snow := .Options.StringOr "color_snow" "var(--color-text-highlight)F"}}
                {{ $color_thunderstorm := .Options.StringOr "color_thunderstorm" "var(--color-text-highlight)"}}
                {{ $color_other := .Options.StringOr "color_other" "var(--color-text-highlight)"}}
              {{/* the following variables define the temperature gradient coloring for the daily rectangles */}}
              {{ $color_red := .Options.StringOr "color_red" "var(--color-negative)" }}
              {{ $color_yellow := .Options.StringOr "color_yellow" "var(--color-text-subdue)" }}
              {{ $color_blue := .Options.StringOr "color_blue" "var(--color-positive)" }}
              {{ $color_white := .Options.StringOr "color_white" "var(--color-text-highlight)" }}
              {{ $temp_red := .Options.FloatOr "temp_red" 27 }}
              {{ $temp_yellow := .Options.FloatOr "temp_yellow" 20 }}
              {{ $temp_blue := .Options.FloatOr "temp_blue" 10.0 }}
              {{ $temp_white := .Options.FloatOr "temp_white" 0 }}
              {{ if eq $temp_unit "fahrenheit" }}
                {{ $temp_red = .Options.FloatOr "temp_red" 80.0 }}
                {{ $temp_yellow = .Options.FloatOr "temp_yellow" 70.0 }}
                {{ $temp_blue = .Options.FloatOr "temp_blue" 50.0 }}
                {{ $temp_white = .Options.FloatOr "temp_white" 30.0 }}
              {{end}}

            {{/* Request 1: get latitude and longitude for user's city */}}
            {{ $location_string := replaceAll " " "%20" (.Options.StringOr "location" "") }}
            {{ $url1 := printf "https://geocoding-api.open-meteo.com/v1/search?name=%s&count=20&language=en&format=json" $location_string }}
            {{ $req1 := newRequest $url1 | getResponse }}
            {{ $latitude := $req1.JSON.String "results.0.latitude" }}
            {{ $longitude := $req1.JSON.String "results.0.longitude" }}

            {{/* Request 2: get daily weather forecast based on latitude and longitude */}}
            {{ $url2 := printf "https://api.open-meteo.com/v1/forecast?latitude=%s&longitude=%s&temperature_unit=%s&daily=temperature_2m_max,temperature_2m_min,weathercode&timezone=America/New_York" $latitude $longitude $temp_unit}}
            {{ $req2 := newRequest $url2 | getResponse }}

            <div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">

              {{/* Show abbreivated day of week */}}
              {{ $dates := $req2.JSON.Array "daily.time" }}
              <div style="position: relative; width: 100%; height: 25px;">
                {{ range $index, $date := $dates }}

                  {{/* prepare to print M Tu W Th F Sa Su */}}
                  {{ $dateString := .String "" }}
                  {{ $parsedDate := $dateString | parseTime "DateOnly" }}
                  {{ $dayOfWeek := $parsedDate.Format "Monday" | trimSuffix "day" | trimSuffix "on" | trimSuffix "es" | trimSuffix "edn" |
                      trimSuffix "urs" | trimSuffix "ri" | trimSuffix "tur" | trimSuffix "n" }}

                  {{/* highlight weekends (Sa Su) */}}
                  {{ $day_color := "" }}
                  {{ if eq $dayOfWeek "Sa" "Su" }}
                    {{ $day_color = $weekend_color }}
                  {{ end }}

                  <div style="text-align: center; width: 10%; height: 25px; line-height: 25px; margin: 0 10% 0 3%; left: {{ mul $index 14 }}%; position: absolute; background-color: {{ $day_color | safeCSS }} ">
                    <p class="size-h4 color-paragraph">{{ $dayOfWeek }}</p>
                  </div>
                {{ end }}
              </div>

              {{/* Show numeric day of month */}}
              <div style="position: relative; width: 100%; height: 25px;">
                {{ range $index, $date := $dates }}
                  {{ $dateString := .String "" }}
                  {{ $trimmedDate := replaceMatches "[0-9]+-[0-9]+-" "" $dateString }}
                  <div style="text-align: center; width: 10%; height: 25px; line-height: 25px; margin: 0 10% 0 3%; left: {{ mul $index 14 }}%; position: absolute;">
                    <p class="size-h4 color-paragraph">{{ $trimmedDate }}</p>
                  </div>
                {{ end }}
              </div>

              {{/* Show weather conditions using fontawesome icons */}}
              <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
              {{ $codes := $req2.JSON.Array "daily.weathercode" }}

              <div style="position: relative; width: 100%; height: 30px;">
                {{ range $index, $thiscode := $codes }}
                  {{ $code := .Int "" }}

                  <div style="text-align: center; width: 10%; height: 25px; line-height: 25px; margin: 0 10% 0 3%; left: {{ mul $index 14 }}% ; position: absolute;">
                  {{ $wtype := "" }}
                  {{ $wicon := "" }}
                  {{ $wcolor := "" }}
                  {{ if eq $code 0 }}
                    {{ $wtype = "Clear" }}
                    {{ $wicon = "fas fa-sun" }}
                    {{ $wcolor = $color_clear }}
                  {{ else if eq $code 1 2 }}
                    {{ $wtype = "Part Clear" }}
                    {{ $wicon = "fas fa-cloud-sun" }}
                    {{ $wcolor = $color_partly }}
                  {{ else if eq $code 3 }}
                    {{ $wtype = "Cloudy" }}
                    {{ $wicon = "fas fa-cloud" }}
                    {{ $wcolor = $color_cloud }}
                  {{ else if eq $code 45 48 }}
                    {{ $wtype = "Fog" }}
                    {{ $wicon = "fas fa-smog" }}
                    {{ $wcolor = $color_smog }}
                  {{ else if eq $code 51 53 55 56 57 }}
                    {{ $wtype = "Drizzle" }}
                    {{ $wicon = "fas fa-cloud-rain" }}
                    {{ $wcolor = $color_drizzle }}
                  {{ else if eq $code 61 63 65 80 81 82 }}
                    {{ $wtype = "Rain" }}
                    {{ $wicon = "fas fa-cloud-showers-heavy" }}
                    {{ $wcolor = $color_rain }}
                  {{ else if eq $code 66 67 }}
                    {{ $wtype = "Freezing Rain" }}
                    {{ $wicon = "fas fa-snowflake" }}
                    {{ $wcolor = $color_freezing_rain }}
                  {{ else if eq $code 71 73 75 77 85 86 }}
                    {{ $wtype = "Snow" }}
                    {{ $wicon = "fas fa-snowman" }}
                    {{ $wcolor = $color_snow }}
                  {{ else if eq $code 95 96 99 }}
                    {{ $wtype = "Thunderstorm" }}
                    {{ $wicon = "fas fa-bolt" }}
                    {{ $wcolor = $color_thunderstorm }}
                  {{ else }}
                    {{ $wtype = "Other" }}
                    {{ $wicon = "fa-solid fa-question" }}
                    {{ $wcolor = $color_other }}
                  {{ end }}
                  <i class={{ $wicon }} style="font-size: 20px; color: {{ $wcolor | safeCSS }};", title = {{$wtype }}></i>
                  </div>
                {{ end }}
              </div>
            </div>

            {{/* ===== show daily min and max temperatures ===== */}}
            {{ $maxTemps := $req2.JSON.Array "daily.temperature_2m_max" }}
            {{ $minTemps := $req2.JSON.Array "daily.temperature_2m_min" }}

            {{/* get overall max and min temp over week's range */}}
            {{/* to determine vertical scale */}}
            <div style="display: flex; justify-content: flex-start; align-items: center;">

              {{ $max_max := 0 }}
              {{ range $maxTemps }}
                  {{ if gt (.Int "") $max_max }}
                    {{ $max_max = (.Int "") }}
                  {{ end }}
              {{ end }}
              {{ $min_min := 999 }}
              {{ range $minTemps }}
                  {{ if lt (.Int "") $min_min }}
                    {{ $min_min = (.Int "") }}
                  {{ end }}
              {{ end }}

              {{/* add a small buffer */}}
              {{ $max_max = add $max_max 1 }}
              {{ $min_min = sub $min_min 1 }}

              {{/* outer div to contain the temp chart */}}
              <div style="position: relative; width: 100%; height: 75px;">
                {{/* get relative % heights for each daily max and min */}}
                {{ $temp_range := sub $max_max $min_min }}

                {{ range $index, $thisHigh := $maxTemps }}
                    {{ $thisLow := index $minTemps $index }}
                    {{ $thisHigh = $thisHigh.Float "" }}
                    {{ $thisLow = $thisLow.Float "" }}

                    {{ $thisHighPct := sub 1 (div (sub $max_max $thisHigh) $temp_range) }}
                    {{ $thisLowPct := div (sub $thisLow $min_min) $temp_range }}

                    {{/* define color gradient per. values between $temp_red and $temp_yellow are shown as a color gradient from $color_red to $color_yellow */}}
                    {{/* for colors partially in range, can represent as negative percent */}}
                    {{ $thisTempRange := sub $thisHigh $thisLow }}
                    {{ $red_pos := mul 100 (div (sub $thisHigh $temp_red) $thisTempRange) | toInt }}
                    {{ $yel_pos := mul 100 (div (sub $thisHigh $temp_yellow) $thisTempRange) | toInt }}
                    {{ $blu_pos := mul 100 (div (sub $thisHigh $temp_blue) $thisTempRange) | toInt }}
                    {{ $whi_pos := mul 100 (div (sub $thisHigh $temp_white) $thisTempRange) | toInt }}
                    {{ $gradient_string := printf "%s %d%%, %s %d%%, %s %d%%, %s %d%%" $color_red $red_pos $color_yellow $yel_pos $color_blue $blu_pos $color_white $whi_pos }}

                    {{/* output daily div */}}
                    <div style="left: {{ mul $index 14 | add 3 }}%; bottom: {{ mul $thisLowPct 100 | toInt }}%;
                      height: {{ mul (sub $thisHighPct $thisLowPct) 100 | toInt }}%; position: absolute;
                      background:linear-gradient({{ $gradient_string | safeCSS }}); width: 10%; text-align: center; border-radius: 10px;">

                      {{/* Based on rectangle height & position, print high and low temperatures either inside or outside the rectangle. */}}
                      {{ $top_pos := -2 }}
                      {{ $bot_pos := -2 }}
                      {{ $pos_thresh := 0.20 }}
                      {{ if lt (div $thisTempRange $temp_range) $pos_thresh }}
                        {{ $top_pos = -17 }}
                        {{ $bot_pos = -19 }}
                      {{ else if and (lt (div $thisTempRange $temp_range) (mul $pos_thresh 2)) (lt (sub 1 $thisHighPct) $thisLowPct) }}
                        {{ $bot_pos = -19 }}
                      {{ else if and (lt (div $thisTempRange $temp_range) (mul $pos_thresh 2)) (gt (sub 1 $thisHighPct) $thisLowPct) }}
                        {{ $top_pos = -17 }}
                      {{ end }}
                        <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: {{ $overlay_color | safeCSS }}; z-index: 1;  border-radius: 10px;">
                          <p style='color: #F0F0F0; position: absolute; top: {{ $top_pos }}px; left: 0px; right: 0px'>{{ $thisHigh | toInt }}</p>
                          <p style='color: #F0F0F0; position: absolute; bottom: {{ $bot_pos }}px; left: 0px; right:0px'>{{ $thisLow | toInt }}</p>
                        </div>
                      </div>
                {{ end }}

              </div>
            </div>

        - type: calendar
          first-day-of-week: sunday
```

```yaml title="formula1.yml" linenums="1"
- name: Formula 1
  # Show a title header on mobile web browsers
  show-mobile-header: true
  # Optionally, if you only have a single page you can hide the desktop navigation for a cleaner look
  # hide-desktop-navigation: true
  columns:

    - size: small
      widgets:

        - type: search
          search-engine: duckduckgo
          bangs:
            - title: YouTube
              shortcut: "!yt"
              url: https://www.youtube.com/results?search_query={QUERY}
            - title: Ecosia
              shortcut: "!e"
              url: https://www.ecosia.org/search?method=index&q={QUERY}
            - title: Kagi
              shortcut: "!k"
              url: https://kagi.com/search?q={QUERY}
            - title: Google
              shortcut: "!g"
              url: https://www.google.com/search?q={QUERY}
            - title: Wikipedia
              shortcut: "!wiki"
              url: https://en.wikipedia.org/wiki/Special:Search/{QUERY}

        - type: custom-api
          title: Last Race Results
          cache: 1d
          url: https://f1api.dev/api/current/last/race
          template: |
            <div class="flex flex-column gap-10">
              <p class="size-h5">{{ .JSON.String "races.raceName" }}</p>
              <ul class="list collapsible-container" data-collapse-after="5">
                {{ range $i, $v := .JSON.Array "races.results" }}
                <li class="flex items-center {{ if eq $i 0 }}color-primary{{ else if eq $i 1 }}color-highlight{{ end }}">
                  <span class="grow min-width-0">{{ .String "position" }}. {{ .String "driver.shortName" }}</span>
                  <span class="shrink-0 text-right">{{ .String "time" }}</span>
                </li>
                {{ end }}
              </ul>
            </div>

        - type: rss
          title: News Feed
          style: vertical-list
          limit: 15
          collapse-after: 5
          # preserve-order: true
          cache: 12h
          feeds:
            - url: https://www.formula1.com/en/latest/all.xml
              title: Formula 1
            - url: https://www.the-race.com/rss/
              title: The Race
            - url: https://www.autosport.com/rss/f1/news/
              title: Autosport
            - url: https://www.motorsport.com/rss/f1/news/
              title: Motorsport
            - url: https://www.planetf1.com/rss
              title: PlanetF1

    - size: full
      widgets:

        - type: split-column
          widgets:

            - type: custom-api
              title: Next Race
              cache: 1h
              url: http://${F1_API_URL}:4463/f1/next_race/
              template: |
                <div class="flex flex-column gap-10">
                  {{ $session := index (.JSON.Array "race") 0 }}
                  <p class="size-h5" style="font-size: 15px;">
                    {{ .JSON.String "season" }}, Round {{ .JSON.String "round" }}
                  </p>

                  <div class="margin-block-4">
                    <p class="color-highlight" style="font-size: 15px;">{{ $session.String "raceName" }}</p>

                    <div class="margin-block-10"></div>

                    <!--FP1 SCHEDULE-->
                    <p class="color-primary" style="font-size: 15px;">
                      <span>Free Practice 1</span>
                      {{ $fp1datetime := .JSON.String "race.0.schedule.fp1.datetime_rfc3339" }}
                      {{ $parsedFP1Time := parseLocalTime "2006-01-02T15:04:05Z07:00" $fp1datetime }}
                      {{ $now := now }}
                      {{ if $parsedFP1Time.Before $now }}
                        <span class="color-highlight">🏁</span>
                      {{else}}
                        <span
                          class="color-highlight"
                          {{ parseRelativeTime "rfc3339" $fp1datetime }}
                        ></span>
                      {{ end }}
                    </p>
                    {{ $fp1datetime := .JSON.String "race.0.schedule.fp1.datetime_rfc3339" }}
                    {{ $part := slice $fp1datetime 0 16 }}
                    {{ $fp1formatted := printf "%s %s" (slice $part 0 10) (slice $part 11 16) }}
                    <p class="size-h5" style="font-size: 13px;">
                      {{ $fp1formatted }}
                    </p>

                    <!--SQ SCHEDULE-->
                    {{ if and (ne ($.JSON.String "race.0.schedule.sprintQualy.date") "null") (ne ($.JSON.String "race.0.schedule.sprintQualy.date") "") }}
                      <p class="color-primary" style="font-size: 15px;">
                        <span>Sprint Qualifying</span>
                        {{ $sqdatetime := .JSON.String "race.0.schedule.sprintQualy.datetime_rfc3339" }}
                        {{ $parsedSQTime := parseLocalTime "2006-01-02T15:04:05Z07:00" $sqdatetime }}
                        {{ $now := now }}
                        {{ if $parsedSQTime.Before $now }}
                          <span class="color-highlight">🏁</span>
                        {{else}}
                          <span
                            class="color-highlight"
                            {{ parseRelativeTime "rfc3339" $sqdatetime }}
                          ></span>
                        {{ end }}
                        </p>
                        {{ $sqdatetime := .JSON.String "race.0.schedule.sprintQualy.datetime_rfc3339" }}
                        {{ $part := slice $sqdatetime 0 16 }}
                        {{ $sqformatted := printf "%s %s" (slice $part 0 10) (slice $part 11 16) }}
                        <p class="size-h5" style="font-size: 13px;">
                          {{ $sqformatted }}
                        </p>
                    {{ end }}

                    <!--SR SCHEDULE-->
                    {{ if and (ne ($.JSON.String "race.0.schedule.sprintRace.date") "null") (ne ($.JSON.String "race.0.schedule.sprintRace.date") "") }}
                      <p class="color-primary" style="font-size: 15px;">
                        <span>Sprint Race</span>
                        {{ $srdatetime := .JSON.String "race.0.schedule.sprintRace.datetime_rfc3339" }}
                        {{ $parsedSRTime := parseLocalTime "2006-01-02T15:04:05Z07:00" $srdatetime }}
                        {{ $now := now }}
                        {{ if $parsedSRTime.Before $now }}
                          <span class="color-highlight">🏁</span>
                        {{else}}
                          <span
                            class="color-highlight"
                            {{ parseRelativeTime "rfc3339" $srdatetime }}
                          ></span>
                        {{ end }}
                        </p>
                        {{ $srdatetime := .JSON.String "race.0.schedule.sprintRace.datetime_rfc3339" }}
                        {{ $part := slice $srdatetime 0 16 }}
                        {{ $srformatted := printf "%s %s" (slice $part 0 10) (slice $part 11 16) }}
                        <p class="size-h5" style="font-size: 13px;">
                          {{ $srformatted }}
                        </p>
                    {{ end }}

                    <!--FP2 SCHEDULE-->
                    {{ if and (ne ($.JSON.String "race.0.schedule.fp2.date") "null") (ne ($.JSON.String "race.0.schedule.fp2.date") "") }}
                      <p class="color-primary" style="font-size: 15px;">
                        <span>Free Practice 2</span>
                        {{ $fp2datetime := .JSON.String "race.0.schedule.fp2.datetime_rfc3339" }}
                        {{ $parsedFP2Time := parseLocalTime "2006-01-02T15:04:05Z07:00" $fp2datetime }}
                        {{ $now := now }}
                        {{ if $parsedFP2Time.Before $now }}
                          <span class="color-highlight">🏁</span>
                        {{else}}
                          <span
                            class="color-highlight"
                            {{ parseRelativeTime "rfc3339" $fp2datetime }}
                          ></span>
                        {{ end }}
                        </p>
                        {{ $fp2datetime := .JSON.String "race.0.schedule.fp2.datetime_rfc3339" }}
                        {{ $part := slice $fp2datetime 0 16 }}
                        {{ $fp2formatted := printf "%s %s" (slice $part 0 10) (slice $part 11 16) }}
                        <p class="size-h5" style="font-size: 13px;">
                          {{ $fp2formatted }}
                        </p>
                    {{ end }}

                    <!--FP3 SCHEDULE-->
                    {{ if and (ne ($.JSON.String "race.0.schedule.fp3.date") "null") (ne ($.JSON.String "race.0.schedule.fp3.date") "") }}
                      <p class="color-primary" style="font-size: 15px;">
                        <span>Free Practice 3</span>
                        {{ $fp3datetime := .JSON.String "race.0.schedule.fp3.datetime_rfc3339" }}
                        {{ $parsedFP3Time := parseLocalTime "2006-01-02T15:04:05Z07:00" $fp3datetime }}
                        {{ $now := now }}
                        {{ if $parsedFP3Time.Before $now }}
                          <span class="color-highlight">🏁</span>
                        {{else}}
                          <span
                            class="color-highlight"
                            {{ parseRelativeTime "rfc3339" $fp3datetime }}
                          ></span>
                        {{ end }}
                        </p>
                        {{ $fp3datetime := .JSON.String "race.0.schedule.fp3.datetime_rfc3339" }}
                        {{ $part := slice $fp3datetime 0 16 }}
                        {{ $fp3formatted := printf "%s %s" (slice $part 0 10) (slice $part 11 16) }}
                        <p class="size-h5" style="font-size: 13px;">
                          {{ $fp3formatted }}
                        </p>
                    {{ end }}

                    <!--QUALY SCHEDULE-->
                    {{ if and (ne ($.JSON.String "race.0.schedule.qualy.date") "null") (ne ($.JSON.String "race.0.schedule.qualy.date") "") }}
                      <p class="color-primary" style="font-size: 15px;">
                        <span>Qualifying</span>
                        {{ $qualydatetime := .JSON.String "race.0.schedule.qualy.datetime_rfc3339" }}
                        {{ $parsedQUALYTime := parseLocalTime "2006-01-02T15:04:05Z07:00" $qualydatetime }}
                        {{ $now := now }}
                        {{ if $parsedQUALYTime.Before $now }}
                          <span class="color-highlight">🏁</span>
                        {{else}}
                          <span
                            class="color-highlight"
                            {{ parseRelativeTime "rfc3339" $qualydatetime }}
                          ></span>
                        {{ end }}
                        </p>
                        {{ $qualydatetime := .JSON.String "race.0.schedule.qualy.datetime_rfc3339" }}
                        {{ $part := slice $qualydatetime 0 16 }}
                        {{ $qualyformatted := printf "%s %s" (slice $part 0 10) (slice $part 11 16) }}
                        <p class="size-h5" style="font-size: 13px;">
                          {{ $qualyformatted }}
                        </p>
                    {{ end }}

                    <!--RACE SCHEDULE-->
                    {{ if and (ne ($.JSON.String "race.0.schedule.race.date") "null") (ne ($.JSON.String "race.0.schedule.race.date") "") }}
                      <p class="color-primary" style="font-size: 15px;">
                        <span>Race</span>
                        {{ $racedatetime := .JSON.String "race.0.schedule.race.datetime_rfc3339" }}
                        {{ $parsedRACEime := parseLocalTime "2006-01-02T15:04:05Z07:00" $racedatetime }}
                        {{ $now := now }}
                        {{ if $parsedRACEime.Before $now }}
                          <span class="color-highlight">🏁</span>
                        {{else}}
                          <span
                            class="color-highlight"
                            {{ parseRelativeTime "rfc3339" $racedatetime }}
                          ></span>
                        {{ end }}
                        </p>
                        {{ $racedatetime := .JSON.String "race.0.schedule.race.datetime_rfc3339" }}
                        {{ $part := slice $racedatetime 0 16 }}
                        {{ $raceformatted := printf "%s %s" (slice $part 0 10) (slice $part 11 16) }}
                        <p class="size-h5" style="font-size: 13px;">
                          {{ $raceformatted }}
                        </p>
                    {{ end }}

                  </div>
                </div>

                    <div style="margin-block: 1rem;">
                      <img
                        src="http://${F1_API_URL}:4463/f1/next_map/"
                        onerror="this.style.display='none'"
                        style="max-width: 100%; height: auto; border-radius: 8px;"
                      />
                    </div>

                    <p class="color-highlight" style="font-size: 14px;">
                      Circuit Details
                    </p>
                    <p class="size-h6" style="font-size: 13px;">
                      Name: {{ $session.String "circuit.circuitName" }}
                    </p>
                    <p class="size-h6" style="font-size: 13px;">
                      Lap Record: {{ $session.String "circuit.lapRecord" }}, {{ $session.String "circuit.fastestLapDriverName" }} ({{ $session.String "circuit.fastestLapYear"}})
                    </p>
                    <p class="size-h6" style="font-size: 13px;">
                      Length: {{ $session.String "laps" }} laps @ {{ $session.String "circuit.circuitLengthKm" }} KMs
                    </p>

            - type: group
              widgets:

                - type: custom-api
                  title: Drivers Standings
                  cache: 5m
                  url: http://${F1_API_URL}:4463/f1/drivers_standings/
                  template: |
                    <ul class="list collapsible-container" data-collapse-after="3">
                      {{ range $i, $v := .JSON.Array "drivers" }}
                      <li class="flex items-center {{ if eq $i 0 }}color-primary{{ else if eq $i 1 }}color-highlight{{ end }}">
                        <div class="grow min-width-0">
                          <span>{{ .String "position" }}. {{ .String "surname" }} <img src="https://flagcdn.com/w20/{{ .String "flag" }}.png"
                                 alt=""
                                 style="width: 20px; height: 14px; object-fit: cover; vertical-align: middle"
                                 class="inline-block rounded-sm" /> </span>
                          {{ $id := .String "teamId" }}
                            <span class="size-h6">
                              ( {{- if eq $id "red_bull" -}}Red Bull
                              {{- else if eq $id "aston_martin" -}}Aston Martin
                              {{- else if eq $id "mercedes" -}}Mercedes
                              {{- else if eq $id "ferrari" -}}Ferrari
                              {{- else if eq $id "mclaren" -}}McLaren
                              {{- else if eq $id "williams" -}}Williams
                              {{- else if eq $id "alpine" -}}Alpine
                              {{- else if eq $id "haas" -}}Haas
                              {{- else if eq $id "rb" -}}RB
                              {{- else if eq $id "sauber" -}}Sauber
                              {{- else -}}{{ $id }}{{- end -}})
                            </span>
                        </div>
                        <span class="shrink-0 text-right">{{ .String "points" }}</span>
                      </li>
                      {{ end }}
                     </ul>

                - type: custom-api
                  title: Constructors Standings
                  cache: 5m
                  url: http://${F1_API_URL}:4463/f1/constructors_standings/
                  template: |
                    <ul class="list collapsible-container" data-collapse-after="5">
                      {{ range $i, $v := .JSON.Array "constructors" }}
                      <li class="flex items-center {{ if eq $i 0 }}color-primary{{ else if eq $i 1 }}color-highlight{{ end }}">
                        <span class="grow min-width-0">
                          {{ .String "position" }}. {{ .String "team" }}<span style="margin-left: 2px;">
                            <img src="https://flagcdn.com/w20/{{ .String "flag" }}.png"
                                 alt=""
                                 style="width: 20px; height: 14px; object-fit: cover; vertical-align: middle"
                                 class="inline-block rounded-sm" />
                          </span>
                        </span>
                        <span class="shrink-0 text-right">{{ .String "points" }}</span>
                      </li>
                      {{ end }}
                    </ul>

        - type: group
          widgets:

            - type: reddit
              style: vertical-list
              subreddit: Formula1
              show-flairs: true
              limit: 10
              collapse-after: 5
              show-thumbnails: true

            - type: reddit
              style: vertical-list
              subreddit: F1News
              show-flairs: true
              limit: 10
              collapse-after: 5
              show-thumbnails: true

            - type: reddit
              style: vertical-list
              subreddit: F1TV
              show-flairs: true
              limit: 10
              collapse-after: 5
              show-thumbnails: true

            - type: reddit
              style: vertical-list
              subreddit: F1Technical
              show-flairs: true
              limit: 10
              collapse-after: 5
              show-thumbnails: true

            - type: reddit
              style: vertical-list
              subreddit: F1Discussions
              show-flairs: true
              limit: 10
              collapse-after: 5
              show-thumbnails: true

    - size: small
      widgets:

        - type: clock
          hour-format: 12h

        - type: weather
          location: Reisterstown, Maryland, United States
          units: imperial # alternatively "metric"
          hour-format: 12h # alternatively "24h"
          # Optionally hide the location from being displayed in the widget
          hide-location: false
          # Optionally show the name of the state or municipality
          show-area-name: true

        - type: custom-api
          title: Air Quality
          cache: 10m
          url: https://api.waqi.info/feed/@8700/?token=7d8557f54bea208aa745eb7105eaeb0aad4d89b8
          template: |
            {{ $aqi := printf "%03s" (.JSON.String "data.aqi") }}
            {{ $aqiraw := .JSON.String "data.aqi" }}
            {{ $updated := .JSON.String "data.time.iso" }}
            {{ $humidity := .JSON.String "data.iaqi.h.v" }}
            {{ $ozone := .JSON.String "data.iaqi.o3.v" }}
            {{ $pm25 := .JSON.String "data.iaqi.pm25.v" }}
            {{ $pressure := .JSON.String "data.iaqi.p.v" }}

            <div class="flex justify-between">
              <div class="size-h5">
                {{ if le $aqi "050" }}
                  <div class="color-positive">Good air quality</div>
                {{ else if le $aqi "100" }}
                  <div class="color-primary">Moderate air quality</div>
                {{ else }}
                  <div class="color-negative">Bad air quality</div>
                {{ end }}
              </div>
            </div>

            <div class="color-highlight size-h2">AQI: {{ $aqiraw }}</div>
            <div style="border-bottom: 1px solid; margin-block: 10px;"></div>

            <div class="margin-block-2">
              <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">

                <div>
                  <div class="size-h3 color-highlight">{{ $humidity }}%</div>
                  <div class="size-h6">HUMIDITY</div>
                </div>

                <div>
                  <div class="size-h3 color-highlight">{{ $ozone }} μg/m³</div>
                  <div class="size-h6">OZONE</div>
                </div>

                <div>
                  <div class="size-h3 color-highlight">{{ $pm25 }} μg/m³</div>
                  <div class="size-h6">PM2.5</div>
                </div>

                <div>
                  <div class="size-h3 color-highlight">{{ $pressure }} hPa</div>
                  <div class="size-h6">PRESSURE</div>
                </div>

              </div>

              <div class="size-h6" style="margin-top: 10px;">Last Updated at {{ slice $updated 11 16 }}</div>
            </div>

        - type: custom-api
          title: Forecast
          body-type: string
          cache: 1h
          options:
            location: ${WEATHER_LOCATION}
            temp_unit: "fahrenheit"
            weekend_color: "#34363D"
            color_clear: "#FFA500"
            color_partly: "#EBE387"
            color_cloud: "#A9A9A9"
            color_smog: "#D3D3D3"
            color_drizzle: "#5F9EA0"
            color_rain: "#4682B4"
            color_freezing_rain: "#B0E0E6"
            color_snow: "#FFFFFF"
            color_thunderstorm: "#696969"
            color_other: "#FFFFFF"
            color_red: "#F08C46"
            color_yellow: "#F0F046"
            color_blue: "#46F0F0"
            color_white: "#FFFFFF"
          template: |
            {{/* THESE VALUES CAN BE CHANGED BY ADDING AN ENTRY TO THE OPTIONS SECTION */}}
              {{ $temp_unit := .Options.StringOr "temp_unit" "celsius" }}
              {{ $weekend_color := .Options.StringOr "weekend_color" "var(--color-separator)" }}
              {{ $overlay_color := .Options.StringOr "overlay_color" "hsl(var(--bghs), var(--bgl), 50%)" }}
              {{/* the following variables define the coloring of the sunny/cloudy/etc. weather icons*/}}
                {{ $color_clear := .Options.StringOr "color_clear" "var(--color-text-highlight)" }}
                {{ $color_partly := .Options.StringOr "color_partly" "var(--color-text-highlight)"}}
                {{ $color_cloud := .Options.StringOr "color_cloud" "var(--color-text-highlight)"}}
                {{ $color_smog := .Options.StringOr "color_smog" "var(--color-text-highlight)"}}
                {{ $color_drizzle := .Options.StringOr "color_drizzle" "var(--color-text-highlight)"}}
                {{ $color_rain := .Options.StringOr "color_rain" "var(--color-text-highlight)"}}
                {{ $color_freezing_rain := .Options.StringOr "color_freezing_rain" "var(--color-text-highlight)"}}
                {{ $color_snow := .Options.StringOr "color_snow" "var(--color-text-highlight)F"}}
                {{ $color_thunderstorm := .Options.StringOr "color_thunderstorm" "var(--color-text-highlight)"}}
                {{ $color_other := .Options.StringOr "color_other" "var(--color-text-highlight)"}}
              {{/* the following variables define the temperature gradient coloring for the daily rectangles */}}
              {{ $color_red := .Options.StringOr "color_red" "var(--color-negative)" }}
              {{ $color_yellow := .Options.StringOr "color_yellow" "var(--color-text-subdue)" }}
              {{ $color_blue := .Options.StringOr "color_blue" "var(--color-positive)" }}
              {{ $color_white := .Options.StringOr "color_white" "var(--color-text-highlight)" }}
              {{ $temp_red := .Options.FloatOr "temp_red" 27 }}
              {{ $temp_yellow := .Options.FloatOr "temp_yellow" 20 }}
              {{ $temp_blue := .Options.FloatOr "temp_blue" 10.0 }}
              {{ $temp_white := .Options.FloatOr "temp_white" 0 }}
              {{ if eq $temp_unit "fahrenheit" }}
                {{ $temp_red = .Options.FloatOr "temp_red" 80.0 }}
                {{ $temp_yellow = .Options.FloatOr "temp_yellow" 70.0 }}
                {{ $temp_blue = .Options.FloatOr "temp_blue" 50.0 }}
                {{ $temp_white = .Options.FloatOr "temp_white" 30.0 }}
              {{end}}

            {{/* Request 1: get latitude and longitude for user's city */}}
            {{ $location_string := replaceAll " " "%20" (.Options.StringOr "location" "") }}
            {{ $url1 := printf "https://geocoding-api.open-meteo.com/v1/search?name=%s&count=20&language=en&format=json" $location_string }}
            {{ $req1 := newRequest $url1 | getResponse }}
            {{ $latitude := $req1.JSON.String "results.0.latitude" }}
            {{ $longitude := $req1.JSON.String "results.0.longitude" }}

            {{/* Request 2: get daily weather forecast based on latitude and longitude */}}
            {{ $url2 := printf "https://api.open-meteo.com/v1/forecast?latitude=%s&longitude=%s&temperature_unit=%s&daily=temperature_2m_max,temperature_2m_min,weathercode&timezone=America/New_York" $latitude $longitude $temp_unit}}
            {{ $req2 := newRequest $url2 | getResponse }}

            <div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">

              {{/* Show abbreivated day of week */}}
              {{ $dates := $req2.JSON.Array "daily.time" }}
              <div style="position: relative; width: 100%; height: 25px;">
                {{ range $index, $date := $dates }}

                  {{/* prepare to print M Tu W Th F Sa Su */}}
                  {{ $dateString := .String "" }}
                  {{ $parsedDate := $dateString | parseTime "DateOnly" }}
                  {{ $dayOfWeek := $parsedDate.Format "Monday" | trimSuffix "day" | trimSuffix "on" | trimSuffix "es" | trimSuffix "edn" |
                      trimSuffix "urs" | trimSuffix "ri" | trimSuffix "tur" | trimSuffix "n" }}

                  {{/* highlight weekends (Sa Su) */}}
                  {{ $day_color := "" }}
                  {{ if eq $dayOfWeek "Sa" "Su" }}
                    {{ $day_color = $weekend_color }}
                  {{ end }}

                  <div style="text-align: center; width: 10%; height: 25px; line-height: 25px; margin: 0 10% 0 3%; left: {{ mul $index 14 }}%; position: absolute; background-color: {{ $day_color | safeCSS }} ">
                    <p class="size-h4 color-paragraph">{{ $dayOfWeek }}</p>
                  </div>
                {{ end }}
              </div>

              {{/* Show numeric day of month */}}
              <div style="position: relative; width: 100%; height: 25px;">
                {{ range $index, $date := $dates }}
                  {{ $dateString := .String "" }}
                  {{ $trimmedDate := replaceMatches "[0-9]+-[0-9]+-" "" $dateString }}
                  <div style="text-align: center; width: 10%; height: 25px; line-height: 25px; margin: 0 10% 0 3%; left: {{ mul $index 14 }}%; position: absolute;">
                    <p class="size-h4 color-paragraph">{{ $trimmedDate }}</p>
                  </div>
                {{ end }}
              </div>

              {{/* Show weather conditions using fontawesome icons */}}
              <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
              {{ $codes := $req2.JSON.Array "daily.weathercode" }}

              <div style="position: relative; width: 100%; height: 30px;">
                {{ range $index, $thiscode := $codes }}
                  {{ $code := .Int "" }}

                  <div style="text-align: center; width: 10%; height: 25px; line-height: 25px; margin: 0 10% 0 3%; left: {{ mul $index 14 }}% ; position: absolute;">
                  {{ $wtype := "" }}
                  {{ $wicon := "" }}
                  {{ $wcolor := "" }}
                  {{ if eq $code 0 }}
                    {{ $wtype = "Clear" }}
                    {{ $wicon = "fas fa-sun" }}
                    {{ $wcolor = $color_clear }}
                  {{ else if eq $code 1 2 }}
                    {{ $wtype = "Part Clear" }}
                    {{ $wicon = "fas fa-cloud-sun" }}
                    {{ $wcolor = $color_partly }}
                  {{ else if eq $code 3 }}
                    {{ $wtype = "Cloudy" }}
                    {{ $wicon = "fas fa-cloud" }}
                    {{ $wcolor = $color_cloud }}
                  {{ else if eq $code 45 48 }}
                    {{ $wtype = "Fog" }}
                    {{ $wicon = "fas fa-smog" }}
                    {{ $wcolor = $color_smog }}
                  {{ else if eq $code 51 53 55 56 57 }}
                    {{ $wtype = "Drizzle" }}
                    {{ $wicon = "fas fa-cloud-rain" }}
                    {{ $wcolor = $color_drizzle }}
                  {{ else if eq $code 61 63 65 80 81 82 }}
                    {{ $wtype = "Rain" }}
                    {{ $wicon = "fas fa-cloud-showers-heavy" }}
                    {{ $wcolor = $color_rain }}
                  {{ else if eq $code 66 67 }}
                    {{ $wtype = "Freezing Rain" }}
                    {{ $wicon = "fas fa-snowflake" }}
                    {{ $wcolor = $color_freezing_rain }}
                  {{ else if eq $code 71 73 75 77 85 86 }}
                    {{ $wtype = "Snow" }}
                    {{ $wicon = "fas fa-snowman" }}
                    {{ $wcolor = $color_snow }}
                  {{ else if eq $code 95 96 99 }}
                    {{ $wtype = "Thunderstorm" }}
                    {{ $wicon = "fas fa-bolt" }}
                    {{ $wcolor = $color_thunderstorm }}
                  {{ else }}
                    {{ $wtype = "Other" }}
                    {{ $wicon = "fa-solid fa-question" }}
                    {{ $wcolor = $color_other }}
                  {{ end }}
                  <i class={{ $wicon }} style="font-size: 20px; color: {{ $wcolor | safeCSS }};", title = {{$wtype }}></i>
                  </div>
                {{ end }}
              </div>
            </div>

            {{/* ===== show daily min and max temperatures ===== */}}
            {{ $maxTemps := $req2.JSON.Array "daily.temperature_2m_max" }}
            {{ $minTemps := $req2.JSON.Array "daily.temperature_2m_min" }}

            {{/* get overall max and min temp over week's range */}}
            {{/* to determine vertical scale */}}
            <div style="display: flex; justify-content: flex-start; align-items: center;">

              {{ $max_max := 0 }}
              {{ range $maxTemps }}
                  {{ if gt (.Int "") $max_max }}
                    {{ $max_max = (.Int "") }}
                  {{ end }}
              {{ end }}
              {{ $min_min := 999 }}
              {{ range $minTemps }}
                  {{ if lt (.Int "") $min_min }}
                    {{ $min_min = (.Int "") }}
                  {{ end }}
              {{ end }}

              {{/* add a small buffer */}}
              {{ $max_max = add $max_max 1 }}
              {{ $min_min = sub $min_min 1 }}

              {{/* outer div to contain the temp chart */}}
              <div style="position: relative; width: 100%; height: 75px;">
                {{/* get relative % heights for each daily max and min */}}
                {{ $temp_range := sub $max_max $min_min }}

                {{ range $index, $thisHigh := $maxTemps }}
                    {{ $thisLow := index $minTemps $index }}
                    {{ $thisHigh = $thisHigh.Float "" }}
                    {{ $thisLow = $thisLow.Float "" }}

                    {{ $thisHighPct := sub 1 (div (sub $max_max $thisHigh) $temp_range) }}
                    {{ $thisLowPct := div (sub $thisLow $min_min) $temp_range }}

                    {{/* define color gradient per. values between $temp_red and $temp_yellow are shown as a color gradient from $color_red to $color_yellow */}}
                    {{/* for colors partially in range, can represent as negative percent */}}
                    {{ $thisTempRange := sub $thisHigh $thisLow }}
                    {{ $red_pos := mul 100 (div (sub $thisHigh $temp_red) $thisTempRange) | toInt }}
                    {{ $yel_pos := mul 100 (div (sub $thisHigh $temp_yellow) $thisTempRange) | toInt }}
                    {{ $blu_pos := mul 100 (div (sub $thisHigh $temp_blue) $thisTempRange) | toInt }}
                    {{ $whi_pos := mul 100 (div (sub $thisHigh $temp_white) $thisTempRange) | toInt }}
                    {{ $gradient_string := printf "%s %d%%, %s %d%%, %s %d%%, %s %d%%" $color_red $red_pos $color_yellow $yel_pos $color_blue $blu_pos $color_white $whi_pos }}

                    {{/* output daily div */}}
                    <div style="left: {{ mul $index 14 | add 3 }}%; bottom: {{ mul $thisLowPct 100 | toInt }}%;
                      height: {{ mul (sub $thisHighPct $thisLowPct) 100 | toInt }}%; position: absolute;
                      background:linear-gradient({{ $gradient_string | safeCSS }}); width: 10%; text-align: center; border-radius: 10px;">

                      {{/* Based on rectangle height & position, print high and low temperatures either inside or outside the rectangle. */}}
                      {{ $top_pos := -2 }}
                      {{ $bot_pos := -2 }}
                      {{ $pos_thresh := 0.20 }}
                      {{ if lt (div $thisTempRange $temp_range) $pos_thresh }}
                        {{ $top_pos = -17 }}
                        {{ $bot_pos = -19 }}
                      {{ else if and (lt (div $thisTempRange $temp_range) (mul $pos_thresh 2)) (lt (sub 1 $thisHighPct) $thisLowPct) }}
                        {{ $bot_pos = -19 }}
                      {{ else if and (lt (div $thisTempRange $temp_range) (mul $pos_thresh 2)) (gt (sub 1 $thisHighPct) $thisLowPct) }}
                        {{ $top_pos = -17 }}
                      {{ end }}
                        <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: {{ $overlay_color | safeCSS }}; z-index: 1;  border-radius: 10px;">
                          <p style='color: #F0F0F0; position: absolute; top: {{ $top_pos }}px; left: 0px; right: 0px'>{{ $thisHigh | toInt }}</p>
                          <p style='color: #F0F0F0; position: absolute; bottom: {{ $bot_pos }}px; left: 0px; right:0px'>{{ $thisLow | toInt }}</p>
                        </div>
                      </div>
                {{ end }}

              </div>
            </div>

        - type: calendar
          first-day-of-week: sunday
```
