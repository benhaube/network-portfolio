---
tags:
  - active
  - service
  - software
  - dns
  - infrastructure
  - network
  - domain
  - native
hide:
  - toc
---
![Technitium Icon](../assets/icons/technitium-light.svg#only-light){ width=200 }
![Technitium Icon](../assets/icons/technitium.svg#only-dark){ width=200 }

# [[Technitium|Technitium DNS Server]]
[GitHub :material-github:](https://github.com/TechnitiumSoftware/DnsServer){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://technitium.com/dns/help.html){ .md-button }

---
## :material-information-outline: Overview
* **Purpose:** An open source authoritative as well as recursive DNS server that can be used for self hosting a DNS server for privacy & security.
* **Port(s):**
    * `53`
    * `443`
    * `5380`
* **URL / Access:** 
    * :material-debian:&nbsp;[[Debian_Server_VM|Debian Server VM]]
        * `192.168.50.6:53`
        * <http://debian-vm.internal:5380>
    * :simple-raspberrypi:&nbsp;[[Raspberry_Pi_4B_Server|Raspberry Pi 4B Server]]
        * `192.168.50.2:53`
        * <http://pi-server.internal:5380>
* **Credentials:** 
    * :services-bitwarden:&nbsp;[Bitwarden](https://vault.bitwarden.com): "Technitium"

## :material-package-down: Deployment Details  
* **Host Device:** 
    * :material-debian:&nbsp;[[Debian_Server_VM|Debian Server VM]]
    * :simple-raspberrypi:&nbsp;[[Raspberry_Pi_4B_Server|Raspberry Pi 4B Server]]
* **Method:** &nbsp;:material-linux:&nbsp;Native Install
* **Container Name:** `N/A`
* **Image:** `N/A`

### :material-cog: Configuration 

#### Install:

```bash title="Command to install Technitium" linenums="1"
curl -sSL https://download.technitium.com/dns/install.sh | sudo bash
```

#### Zones:

```conf title="50.168.192.in-addr.arpa"
$ORIGIN 50.168.192.in-addr.arpa.
@                     0         IN  SOA           debian-vm.internal. invalid. 14 900 300 604800 900
@                     0         IN  FWD           Udp "192.168.50.1" True DefaultProxy 0
1                     3600      IN  PTR           asusrouter.internal.
153                   3600      IN  PTR           k1c-a71e.internal.
2                     3600      IN  PTR           pi-server.internal.
221                   3600      IN  PTR           aimesh-node.internal.
3                     3600      IN  PTR           proxy.pi-zero.internal.
4                     3600      IN  PTR           storage-server.internal.
5                     3600      IN  PTR           storage-server-2.internal.
6                     3600      IN  PTR           debian-vm.internal.
61                    3600      IN  PTR           bens-workstation.internal.
```

```conf title="internal"
$ORIGIN internal.
@                     900       IN  SOA           debian-vm admin.haube-pereira.com. 145 900 300 604800 900
@                     14400     IN  NS            debian-vm
@                     14400     IN  NS            pi-server
@                     3600      IN  RRSIG         48 13 1 3600 1772997738 1771784538 45234 @ MhNrTJWYR3Kq+0MYKUnuUWQ98dC32xHw95QM6GO0xq9PCpUZz/Zm4H7Ck4ssxjETi7pJGx1rwE/Mvv6UWJwq6g==
@                     900       IN  RRSIG         47 13 1 900 1772998082 1771784882 18661 @ v10ofvItGMvRxZ77WNOxMz3Upkf13i2jt2hmN8d93Vx2WuONg0nVARrp1YmZhVRWR6ZrE3n+U5ukjpzkjD3sMQ==
@                     14400     IN  RRSIG         2 13 1 14400 1773000175 1771786975 18661 @ CNLyPMbvSJ+lHoqiPSO5B90HujqwZmFpbmuVzHPwYqTGKrha9TlnRwqerTbD+HhoeCOmmfp89AC5werFtIoR5w==
@                     900       IN  RRSIG         6 13 1 900 1773686670 1772473470 18661 @ W8Ae25TZJJQT5uBb+G/5eTl4g4DOPJ/VqR7DWwWU99WGB8LOwyqxyECOFCyKA9pw97NDbP5sQTlyVIPIAE5UvQ==
@                     900       IN  NSEC          aimesh-node NS SOA RRSIG NSEC DNSKEY
@                     3600      IN  DNSKEY        257 3 13 eEMVM1L3iA0WzqohRkkGpRwbOWcDQIKTOXQvWFhJ4rLJrC94JKrHx1CkAk4KUcd+XnjQTkeBmShXKVHWcBOETw==
@                     3600      IN  DNSKEY        256 3 13 NZRoZ/7sLF4IZvVj2WfXcZQPD3u6nTDMzx+Nz3w6hXme+5o8Rz45mCBzH565ZzrVmJT/Ncpat+HKsSRdzTsapw==
aimesh-node           3600      IN  A             192.168.50.221
aimesh-node           3600      IN  RRSIG         1 13 2 3600 1772998082 1771784882 18661 @ ObXr6OrS0GZH8Iocg4X92BwpR8KwNXgA8e7n2C1HDXCBJXWnHskBT5z62yHINc+l9IbS8FAWRtlObp60FxL4dg==
aimesh-node           900       IN  RRSIG         47 13 2 900 1772998082 1771784882 18661 @ RXiUm0mwj83Y4NWcZhQTvedHnPjw9jyd3/bUcrJV98P9FGBQf6aod6IfbLy5wPueA7hcKxdqEd7rVu9rEMgD3Q==
aimesh-node           900       IN  NSEC          asusrouter A RRSIG NSEC
asusrouter            3600      IN  A             192.168.50.1
asusrouter            3600      IN  RRSIG         1 13 2 3600 1772997887 1771784687 18661 @ vkx+HZVbnk3EpEX/7+g9Sl4+6QY2sge419XP1YWU37AGizB2cBb/7m3/qOSaikXHTDu7udzHclSw+n6sG/XySA==
asusrouter            900       IN  RRSIG         47 13 2 900 1772998009 1771784809 18661 @ /Zxg2LO/+zNcXUHoVVkZNdP0j3olwbK2BoAIvaZXNG7pZiUOdtNIepbmTx2FspWmKA7ZoYDsbl4Xzx92VoJlRg==
asusrouter            900       IN  NSEC          bens-workstation A RRSIG NSEC
bens-workstation      3600      IN  A             192.168.50.61
bens-workstation      3600      IN  RRSIG         1 13 2 3600 1772998009 1771784809 18661 @ whqDSuGnj31zp7pVPihJyxb48TYcRUpp4IJgPhYoOvX6NnWdHeck527zB2XxnQWY86C0xZq8O1xXM3ouIeHX9g==
bens-workstation      900       IN  RRSIG         47 13 2 900 1773183683 1771970483 18661 @ W0a9Gw9MmkZD+jK57iS1LDKEFR8n2cPAzftAi6pQHPQD1WlB2xHLi8xoH7nxWcz3pfWBC/g9Zei3T1/0Dxmpqw==
bens-workstation      900       IN  NSEC          beszel A RRSIG NSEC
beszel                3600      IN  RRSIG         5 13 2 3600 1773183683 1771970483 18661 @ PMFOh+35xsrinyBzre9/KU4L7j5df1ULHlZ23NmLOYYOjsSogdLKapWfys15SWe7HgmE09dgr1etSj0wsAP9fg==
beszel                900       IN  RRSIG         47 13 2 900 1773183683 1771970483 18661 @ Tzn8WD45obYP7WdOzB7PGjMp/TcowpK6909gqYSG7Ehn7Vt7j2HemQ26e186yHHAqxO8eK9cyQm5f8d2jg7Jmw==
beszel                900       IN  NSEC          debian-vm CNAME RRSIG NSEC
beszel                3600      IN  CNAME         pi-zero			;CNAME alias record for Beszel pointing to pi-zero.internal Caddy reverse proxy server.
debian-vm             3600      IN  A             192.168.50.6			;Cluster managed record. Do not update or delete.
debian-vm             900       IN  RRSIG         47 13 2 900 1772997738 1771784538 18661 @ Tp6Y7pUZUPnHxy3HiWPveUFzThbasvYBehx5aK12/NjGgcvFI0Bed3S9q/zC4F8AzF6u6byYFoDFz1tFK+yGug==
debian-vm             3600      IN  RRSIG         1 13 2 3600 1772997832 1771784632 18661 @ AbPBVJ9VXi7d0is3aIOSRvEAJEgyAdkIyJSoIkKPl5DzexyyTN9Gpl6lsuCzutyVz0PWj0WZfEcUKFBVoaLubg==
debian-vm             900       IN  NSEC          _53443._tcp.debian-vm A RRSIG NSEC
_53443._tcp.debian-vm  3600      IN  TLSA          3 1 1 B33177A9C6F10FEC429A9E44C2AAB37386339B13892B2CEC5C3D5E91C4E6D69D			;Cluster managed record. Do not update or delete.
_53443._tcp.debian-vm  3600      IN  RRSIG         52 13 4 3600 1772997738 1771784538 18661 @ DAkPiRYx3DcPMhih3RYeuGjwS1OPJwWp1W6jOoeegLEnorLfw4hYHb6iQYYqUswXbM3teqfzB0tz411XEI8HVw==
_53443._tcp.debian-vm  900       IN  RRSIG         47 13 4 900 1773183439 1771970239 18661 @ S2w4KbOmCJhIjbTYhnAm7zxEKCSD/7o/Fes1rv0pLWVBmOmAbG39LEA8eL50oYM/WYgo9AQb8fb8WH55ZUJAqQ==
_53443._tcp.debian-vm  900       IN  NSEC          glance RRSIG NSEC TLSA
glance                3600      IN  RRSIG         5 13 2 3600 1773183460 1771970260 18661 @ iybgvUNvcRl0kiwKj0v04hBaiOOTCqxfvkTRFa3MEkPRaAqDUyDhiVBNfco0bHYe/PxRW6/NvC3bhjGsX0OL2g==
glance                900       IN  RRSIG         47 13 2 900 1773686103 1772472903 18661 @ hOIzImq/v0P8IU2g0Q01TJfhRK6pVyvMZvVrqdsLGrAx5Wg9MPGd2wISeaPqXb+C4X+vuGSUmaDrXr8GTkDS9g==
glance                900       IN  NSEC          immich CNAME RRSIG NSEC
glance                3600      IN  CNAME         pi-zero			;CNAME alias record for Glance pointing to pi-zero.internal Caddy reverse proxy server.
immich                3600      IN  RRSIG         5 13 2 3600 1773182870 1771969670 18661 @ X6FqgkrRwzTPekqh8s03HgSoxgJByvC8kckwRSZXDeuecq401YCEo7LEoev36jxXAHlF40yD8SmKqZYIssnQTQ==
immich                900       IN  RRSIG         47 13 2 900 1773183201 1771970001 18661 @ k7SasigbcyipyW1fT0LCHD3ZDFBj7h7q5W2PvdxUW5Q7WbTJT3og2OdGpkjFt1ZMtVxkpfAECniT2xHMSUYNVQ==
immich                900       IN  NSEC          it-tools CNAME RRSIG NSEC
immich                3600      IN  CNAME         pi-zero			;CNAME Alias record pointing to Caddy reverse proxy server on pi-zero.internal
it-tools              3600      IN  RRSIG         5 13 2 3600 1773183201 1771970001 18661 @ QD4lwi91ohEf6b/KRHa9v3zwk9Huz1zldQoiD42T4l23GJKAC105YRsYvUPtTD6UBkx8xhyf/xr0fJKLci5IAA==
it-tools              900       IN  RRSIG         47 13 2 900 1773183201 1771970001 18661 @ HbnkU91EN+N4mZSrW3gC3nGCnU5xDmDvlUo0636Jlxufzfwi9vG1NDYMsM7jvUO+mymgDG0hFVji6LVf0GrJIw==
it-tools              900       IN  NSEC          k1c-a71e CNAME RRSIG NSEC
it-tools              3600      IN  CNAME         pi-zero			;CNAME alias record for IT-Tools pointing to pi-zero.internal Caddy reverse proxy server.
k1c-a71e              3600      IN  A             192.168.50.153
k1c-a71e              3600      IN  RRSIG         1 13 2 3600 1772998035 1771784835 18661 @ yB1ydYrDHHiG6RdugRBY2UHuspTJZQE/IXqLA3u0VG8ftOFOkPfJ69QtrUBpKcqRoufB7JiCo8/xjT+3dVaWSw==
k1c-a71e              900       IN  RRSIG         47 13 2 900 1773686628 1772473428 18661 @ ep2F7BahIp3xa+8NcA658RI6DkY48IaGURn8qt1pEp6UW4brDAZ/Sn4Gw/GtRKhzZ738dz/zpUUWZaSVmIZMoA==
k1c-a71e              900       IN  NSEC          pi-server A RRSIG NSEC
pi-server             3600      IN  A             192.168.50.2			;Cluster managed record. Do not update or delete.
pi-server             3600      IN  RRSIG         1 13 2 3600 1773000175 1771786975 18661 @ CwQNAhlCFmO/R+Wlgx1Mg9/w6TsKO1H3PgG2V5XK7XSOvAHCSX6Ww/8DKWUC1KMyj41/D8RSerKeXfO4jsB/9w==
pi-server             900       IN  RRSIG         47 13 2 900 1773000175 1771786975 18661 @ oNHHDjv5kw+XH/cStuXU4QWiWbv8fSIsL3dSYucPp4h5slfnevlzzzC5lGfSlX2HCyEzm461d7MjuEYJoW0XvQ==
pi-server             900       IN  NSEC          _53443._tcp.pi-server A RRSIG NSEC
_53443._tcp.pi-server  3600      IN  TLSA          3 1 1 68BBAC03794E45710202F0F17C7604FFDFAFCE7C2E1439E4C067425E2862F88D			;Cluster managed record. Do not update or delete.
_53443._tcp.pi-server  3600      IN  RRSIG         52 13 4 3600 1773000175 1771786975 18661 @ W6eBksDl0SIizWRHQ4u7BRl4vq1k0S/L8qQnhQSM1NxHRGTSe+R7zBOXrv/i0PQzFdzP3xbAI177iRrSlWNxNA==
_53443._tcp.pi-server  900       IN  RRSIG         47 13 4 900 1773182287 1771969087 18661 @ ihsTBcz4kNRxWjdeqBU+fsBANMBYoW7cnNuw0tPsq4wxpAgzYSiEl+rVhSx3VqQSvHu37YL5dFjk+1GLdQlvug==
_53443._tcp.pi-server  900       IN  NSEC          pi-zero RRSIG NSEC TLSA
pi-zero               3600      IN  A             192.168.50.3
pi-zero               3600      IN  RRSIG         1 13 2 3600 1773182287 1771969087 18661 @ b8AiiKfjM0DLA3rxA6Sr/uMKRF+6dFolIIpdGmAThGC93NpqLdD4NUU7Vlg4guHYqLDswW0ZIjY0+D41wteW+w==
pi-zero               900       IN  RRSIG         47 13 2 900 1773686670 1772473470 18661 @ ZRwDm2rTA9EXs8V8llEgpt3xJEa1CUxK0N0OAgoH/tlc03V5c698ksbpMhwUGZpK2uoWmwMll+562bPupNS0/A==
pi-zero               900       IN  NSEC          spoolman A RRSIG NSEC
spoolman              3600      IN  RRSIG         5 13 2 3600 1773686670 1772473470 18661 @ W+v39b/dmsUBmuSt7niTaL+2LUafLJ/JSUTFjC3MdgHGROpJqwj9eUrB5MLExLjhXKDQA2bUj9oinxGneJvi3Q==
spoolman              900       IN  RRSIG         47 13 2 900 1773686670 1772473470 18661 @ mAP326Ft6EcGp8ApU2QkxmfPorxA3CxybSnO4IRY9MYWrkC9WjncppLf++S+O+1Y9bl9CqcG6s4kSWAkzogphQ==
spoolman              900       IN  NSEC          storage-server CNAME RRSIG NSEC
spoolman              3600      IN  CNAME         pi-zero			;CNAME record for Spoolman server pointing to pi-zero.internal Caddy reverse proxy server.
storage-server        3600      IN  A             192.168.50.4
storage-server        3600      IN  RRSIG         1 13 2 3600 1772997960 1771784760 18661 @ H47rMnVZALdkWej4oUUa/0tbUKcBPPzrUeMRBuLPs3BBH4r9ekcy5yW7x0DRYPH58bCS3j/MMNLgM8dgZyqeDQ==
storage-server        900       IN  RRSIG         47 13 2 900 1772997975 1771784775 18661 @ Kx26kfK1jagq5WYU9l2C5rRvcFmfpmU42WbifNtx4nte+jz/35bM9atKZqMbwNsylIzG9sP9Uu4+H7WMu5+8JA==
storage-server        900       IN  NSEC          storage-server-2 A RRSIG NSEC
storage-server-2      3600      IN  A             192.168.50.5
storage-server-2      3600      IN  RRSIG         1 13 2 3600 1772997975 1771784775 18661 @ BbcJsV7KH1cKhlLbISpJRmIusOxVspucmNyn66jqLsHsy6nEpsaKsTv4/XKqikEU1Q42z24QHHIuscLfx9youQ==
storage-server-2      900       IN  RRSIG         47 13 2 900 1773586689 1772373489 18661 @ VQeqUchYrK0HVTnwF8YRzQ2VhmiQr38C0mG1ttn7bfK/Q5UyxT4lRtzyd/8VN0AzxeB6nuKAxJoLcexQ50VdAA==
storage-server-2      900       IN  NSEC          technitium A RRSIG NSEC
technitium            3600      IN  RRSIG         5 13 2 3600 1773586689 1772373489 18661 @ MVoZj/OA5WS/8OJ1WTSm/dB5ejAE8r237+6XzK/NQbfylGWzuHJ/uyJ+ZqTyFpbIl0xybMkzM7AKX2NHV/+tZQ==
technitium            900       IN  RRSIG         47 13 2 900 1773587631 1772374431 18661 @ 274jyT4v18T8N1Hhc12EiF/rWfQle1bEswxi27FGcoZJlNsJxF6ZB4zuHaixaFi9isQF490YhGbRucCs25mpqg==
technitium            900       IN  NSEC          yt-dlp CNAME RRSIG NSEC
technitium            3600      IN  CNAME         pi-zero			;CNAME alias record for Technituim DNS Cluster pointing to pi-zero.internal Caddy reverse proxy server.
yt-dlp                3600      IN  RRSIG         5 13 2 3600 1773232152 1772018952 18661 @ u1cnFs1uP5OC6P8cBWWrruxWY393Vx2xp9/BqL82l8AFw3ym6vkekigo05NVDx+8FyQIF/O/oIDR1fY+rTmMVg==
yt-dlp                900       IN  RRSIG         47 13 2 900 1773232152 1772018952 18661 @ KSCWYotmXk77SmabgIeHFdexIXgc19Y3d95jyfAdEpcO1cxOdxAWfoQAGdZ44x/lqbCTdPm7JeeIBu9SDs+4mA==
yt-dlp                900       IN  NSEC          @ CNAME RRSIG NSEC
yt-dlp                3600      IN  CNAME         pi-zero			;CNAME alias record for yt-dlp pointing to pi-zero.internal
```

```conf title="cluster-catalog.internal"
$ORIGIN cluster-catalog.internal.
@                     0         IN  SOA           invalid. invalid. 11 300 60 604800 900
@                     0         IN  NS            invalid.
allow-query.ext       0         IN  APL           1:0.0.0.0/0 2:::/0
allow-transfer.ext    0         IN  APL           1:192.168.50.2/32
transfer-tsig-key-names.ext  0         IN  PTR           @
version               0         IN  TXT           "2"
3nistvi4astbs.zones   0         IN  PTR           internal.
zone-type.ext.3nistvi4astbs.zones  0         IN  TXT           "primary"
88phtvucafiic.zones   0         IN  PTR           50.168.192.in-addr.arpa.
zone-type.ext.88phtvucafiic.zones  0         IN  TXT           "forwarder"
```
