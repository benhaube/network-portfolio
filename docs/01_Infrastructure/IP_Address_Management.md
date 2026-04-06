---
hide:
  - toc
---
![[ip-network.svg|200]]
# [[IP_Address_Management|Network IP Address Management (IPAM)]]
> [!info]+
> A systematic approach to planning, tracking, and managing IP address space and associated services like DNS and DHCP within a network.

---
## :material-lan: Local Network(s)
> [!info]+
> The list of software defined, segmented subnets or VLANs.

| VLAN | SSID | Subnet | Subnet Mask | Gateway | DNS Servers | Domain | Role / Notes |
| :--- | :--- | :----- | :---------- | :------ | :---------- | :----- | :----------- |
| vlan50 | :material-wifi:&nbsp;*Home* | `192.168.50.0/24` | `255.255.255.0` | `192.168.50.1` | `192.168.50.6` `192.168.50.2` *\[[Technitium](../03_Services/Technitium.md) (DoT)]* | internal | :material-security: Trusted |
| vlan52 | :material-wifi:&nbsp;*Home_Guest* | `192.168.52.0/24` | `255.255.255.0` | `192.168.52.1` | `9.9.9.9` `149.112.112.112` *\[[Quad-9](https://quad9.net) (DoT)]* | - | :material-account-multiple: Guest |
| vlan53 | :material-wifi:&nbsp;*2G_IoT* | `192.168.53.0/24` | `255.255.255.0` | `192.168.53.1` | `9.9.9.9` `149.122.122.122` *\[[Quad-9](https://quad9.net) (DoT)]* | - | :material-home-automation: IoT |

---
## :material-router-wireless: Core Infrastructure *(Static & Reserved)*
> [!info]+
> Manually assigned IP address information for the core infrastructure of the LAN. *(e.g., servers, routers, access-points)*

| Device Name | VLAN | IP Address | Hostname | Type | Role / Notes |
| :---------- | :--- | :--------- | :------- | :--- | :----------- |
| :material-router-wireless: [ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md) | - | `192.168.50.1` | `asusrouter.internal` | Static | Main Gateway, NTP Master, DHCP Server |
| :material-server: [Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) *(eth0)* | vlan50 | `192.168.50.2` | `pi-server.internal` | Static | DNS Secondary *([[Technitium]] cluster)*, [CUPS](../03_Services/CUPS_Print_Server.md) |
| :material-server: [Raspberry Pi Zero 2 W](../02_Hardware/Raspberry_Pi_Zero_2_W.md) | vlan50 | `192.168.50.3` | `proxy.pi-zero.internal` | Static | Caddy reverse proxy server for local domain names | 
| :material-nas: [ZimaBoard 2 NAS](../02_Hardware/ZimaBoard_2_NAS.md) *(eth0)* | vlan50 | `192.168.50.4` | `storage-server.internal` | Static | Main File Server *(eth0)* |
| :material-nas: [ZimaBoard 2 NAS](../02_Hardware/ZimaBoard_2_NAS.md) *(eth1)* | vlan50 | `192.168.50.5` | `storage-server-2.internal` | Static | SMB Multi-channel Path *(eth1)* |
| :material-server: [Debian Server VM](../02_Hardware/Debian_Server_VM.md) | vlan50 | `192.168.50.6` | `debian-vm.internal` | Reserved | DNS Primary *([[Technitium]] cluster)*, VM on [ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) |
| :material-router-wireless: [ASUS RT-AX55](../02_Hardware/ASUS_RT-AX55.md) | vlan50 | `192.168.50.221` | `aimesh-node.internal` | Reserved | AiMesh Node *(Backhaul)* |
| :material-wan: [Hitron Modem](../02_Hardware/Hitron_Modem.md) | - | `192.168.100.1` | `hitron-modem.internal` | Static | WAN Connection for [ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md) |

---
## :material-desktop-tower: Key Clients *(DHCP Reserved)*
> [!info]+
> Manually assigned IP address information for key clients on the LAN. *(e.g., desktop PCs, printers, IoT devices)*

| Device Name | VLAN | IP Address | Hostname | Role / Notes |
| :---------- | :--- | :--------- | :------- | :----------- |
| :material-desktop-tower: [Ben's Desktop](../02_Hardware/Ben's_Desktop.md) | vlan50 | `192.168.50.61` | `bens-workstation.internal` | Fedora Linux 43 *(KDE Plasma Desktop Edition)* |
| :material-printer-3d-nozzle: [Kacey 3D-Printer](../02_Hardware/Kacey_3D-printer.md) | vlan50 | `192.168.50.153` | `k1c-a71e.internal` | Creality K1C *(Modified)* |
| :material-server: [Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) *(wlan0)* | vlan53 | `DHCP` | - | DHCP, [Home Assistant](../03_Services/Home_Assistant.md)|

---
## :material-web: Dynamic DNS Provider(s)
> [!info]+
> The list of DDNS providers that monitor the leased public IP address for changes  and bind it to a permanent domain name, enabling remote access to the local network.

| Status | Server | Provider | Domain Name | TLS Certificate | Certificate Expire |
| :----- | :----- | :------- | :---------- | :-------------- | :----------------- |
| *Active* | :material-router-wireless: [ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md) | [ASUS](https://asus.com) | https://remote-access-home-34.asuscomm.com | :simple-letsencrypt: Lets Encrypt | 06-07-2026 |

---
## :material-vpn: VPN Server(s) / Client(s)
> [!info]+
> The active VPN servers and clients that enable remote access to the services hosted on the local network.

:simple-wireguard: **WireGuard @ [[ASUS_RT-BE92U|ASUS RT-BE92U]]**<br>*(the main server)*

| Client | IP Address | DNS Server(s) | Endpoint |
| :----- | :--------- | :------------ | :------- |  
| :material-cellphone: Ben's-Phone | `10.6.0.2/32` | `192.168.50.6` `192.168.50.2` | remote-access-home-34.asuscomm.com:41820 |
| :material-laptop: Ben's-Laptop | `10.6.0.3/32` | `192.168.50.6` `192.168.50.2` | remote-access-home-34.asuscomm.com:41820 |
| :material-cellphone: Rob's-Phone | `10.6.0.4/32` | `10.6.0.1` *\[Quad-9 (DoT)]* | remote-access-home-34.asuscomm.com:41820 |
| :material-laptop: Rob's-Laptop | `10.6.0.5/32` | `10.6.0.1` *\[Quad-9 (DoT)]* | remote-access-home-34.asuscomm.com:41820 |

:simple-wireguard: **WireGuard @ [[ZimaBoard_2_NAS|ZimaBoard 2 NAS]]**<br>*(the backup server)*

| Client | IP Address | DNS Server(s) | Endpoint |
| :----- | :--------- | :------------ | :------- |  
| :material-laptop: ben-laptop | `10.8.0.2/32` `fd42:42:42::2/128` | `192.168.50.6` `192.168.50.2` | remote-access-home-34.asuscomm.com:51820 |
| :material-cellphone: ben-pixel | `10.8.0.3/32` `fd42:42:42::3/128` | `192.168.50.6` `192.168.50.2` | remote-access-home-34.asuscomm.com:51820 |
| :material-laptop: rob-laptop | `10.8.0.4/32` `fd42:42:42::4/128` | `192.168.50.6` `192.168.50.2` | remote-access-home-34.asuscomm.com:51820 |
| :material-cellphone: rob-phone | `10.8.0.5/32` `fd42:42:42::5/128` | `192.168.50.6` `192.168.50.2` | remote-access-home-34.asuscomm.com:51820 |

---
## :material-ethernet: MAC Address Tables
> [!info]+
> Tables containing devices on the LAN and their hardware MAC addresses.

* [[MAC_Address_Tables|MAC Address Tables]]

---
## :material-sitemap: Network Maps
> [!info]+
> Mermaid.js dynamic diagrams of the physical network and logical network.

* [Physical Map](../01_Infrastructure/Physical_Map.md)
* [Logical Map](../01_Infrastructure/Logical_Map.md)
