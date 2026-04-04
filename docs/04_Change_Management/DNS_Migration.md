---
hide:
  - toc
---
![[pi-hole.svg|150]] ![[arrow-right-bold.svg|100]] ![[technitium.svg|150]]

# [[DNS_Migration|DNS Migration: Pi-hole to Technitium]]
> [!info]
> Checklist of steps required to migrate the local-network DNS resolution from *[[Pi-hole]]* to *[[Technitium]]*.

---
## :material-file-document: Phase 1: Pre-Migration & Documentation
1. **Export Pi-hole Data:** 
    + [ ] Run a "Teleporter" backup on your current primary and secondary Pi-holes.
2. **Document Static Records:** 
    + [ ] Note all local DNS records and DHCP reservations *(if Pi-hole is handling DHCP)*.
3. **Map IP Addresses:**
    + [ ] Primary :simple-raspberrypi:&nbsp;*([[Raspberry_Pi_4B_Server|Raspberry Pi 4B Server]])*: `192.168.50.2` 
    + [ ] Secondary :simple-debian:&nbsp;*([[Debian_Server_VM|Debian Server VM]])*: `192.168.50.6`
    + [ ] Tertiary/Failover :simple-raspberrypi:&nbsp;*([[Raspberry_Pi_Zero_2_W|Raspberry Pi Zero Server]])*: `192.168.50.3`
---
## :material-dns: Phase 2: Server Provisioning
**Debian VM (ZimaOS):**

1. **Allocate Resources:** 
    + [ ] Assign 2 vCPUs and 2GB RAM to the VM.
2. **Install Technitium:** 
    + [ ] Use the installer script or Docker container.
3. **Configure Upstream:** 
    + [ ] Set Quad9 DoT *(`9.9.9.9:853` and `149.112.112.112:853`)*.
4. **Import Records:** 
    + [ ] Manually add local DNS zones/records from the Pi-hole export.

**Raspberry Pi 4B:**

1. **Uninstall Pi-hole:**
    + [ ] Use the command `sudo pihole uninstall` to remove Pi-hole from the server.
2. **Install Technitium:** 
    + [ ] Match the version running on the Debian VM.
3. **Set as Secondary:** 
    + [ ] Configure identical upstream servers.

---
## :material-cog-sync: Phase 3: Cluster Synchronization
1. **Enable Clustering:** 
    + [ ] Set the Debian VM as the **Master**.
    + [ ] Set the Pi 4B as the **Slave**.
2. **Verify Sync:** 
    + [ ] Ensure local zones and blocklists are appearing on both instances.
3. **Blocklist Tuning:** 
    + [ ] Add your preferred lists *(e.g., OISD, HaGeZi)* and verify they are enabled on both.
---
## :material-toggle-switch-outline: Phase 4: Network Cutover
1. **Update Router DHCP:** 
    + [ ] Point DNS 1 to the Debian VM IP.
    + [ ] Point DNS 2 to the Pi 4B IP.
    + [ ] *(Optional)* Point DNS 3 to the Pi Zero IP.
2. **Clear Local Caches:** 
    + [ ] Flush DNS on your main workstation *(`resolvectl flush-caches` or `ipconfig /flushdns`)*.
3. **Test Resolution:** 
    + [ ] Run `dig @[Primary-IP] google.com` and verify the `SERVER` field.
---
## :material-web-check: Phase 5: Verification & Safety Net
1. **Check DoT Status:** 
    + [ ] Run `dig @[Primary-IP] +short txt proto.on.quad9.net` to ensure the upstream is encrypted.
2. **Verify Pi Zero Fallback:** 
    + [ ] Temporarily stop the Technitium service on both the VM and Pi 4B. Confirm the Pi Zero Pi-hole takes over resolution.
3. **Audit Dashboard:** 
    + [ ] Monitor the Technitium dashboard for any unexpected NXDOMAIN responses or high latency.
---

```mermaid
graph LR

	%% --- Class Definitions ---
	%% classDef box fill:#255425,stroke:#4cae4f,stroke-width:2px;

    %% Phase 1
    subgraph Phase_1 ["<b>Phase 1:</b> Pre-Migration & Documentation"]
        direction TB
        Export("<b>Export Pi-hole Data:</b> Run a 'Teleporter' backup on your current primary and secondary Pi-holes."):::box
        Document("<b>Document Static Records:</b> Note all local DNS records and DHCP reservations <i>(if Pi-hole is handling DHCP)</i>."):::box
        Map("<b>Map IP Addresses:</b>"):::box
        Primary("<b>Primary</b> (Raspberry Pi 4B): 192.168.50.2"):::box 
        Secondary("<b>Secondary</b> (Debian VM): 192.168.50.6"):::box
        Tertiary("<b>Tertiary/Failover</b> (Raspberry Pi Zero 2W): 192.168.50.3"):::box
    end
    
    %% Connections (Phase_1)
    Export --> Document
    Document --> Map
    Map --> Primary
    Map --> Secondary
    Map --> Tertiary
    Phase_1 ==> Phase_2
    
    %% Phase 2
    subgraph Phase_2 ["<b>Phase 2:</b> Server Provisioning"]
        direction TB
        subgraph Debian_VM ["<b>Debian VM (ZimaOS):</b>"]
            direction TB:::box
            Allocate("<b>Allocate Resources:</b> Assign 2 vCPUs and 2GB RAM to the VM."):::box
            Install("<b>Install Technitium:</b> Use the installer script or Docker container."):::box
            Configure("<b>Configure Upstream:</b> Set Quad9 DoT <i>(9.9.9.9:853 and 149.112.112.112:853)</i>."):::box
            Import("<b>Import Records:</b> Manually add local DNS zones/records from the Pi-hole export."):::box
        end
        subgraph RasPi_4B ["<b>Raspberry Pi 4B:</b>"]
            direction TB:::box
            Install_Pi("<b>Install Technitium:</b> Match the version running on the Debian VM."):::box
            Set_Secondary("<b>Set as Secondary:</b> Configure identical upstream servers."):::box
        end   
    end
    
    %% Connections (Phase_2)
    Allocate --> Install
    Install --> Configure
    Configure --> Import
    
    Debian_VM --> RasPi_4B
    
    Install_Pi --> Set_Secondary
    Phase_2 ==> Phase_3
    
    %% Phase 3
    subgraph Phase_3 ["<b>Phase 3:</b> Cluster Synchronization"]
        direction TB
        Enable_Clustering("<b>Enable Clustering:</b>"):::box
        DebianVM_Master("Set the Debian VM as the <b>Master</b>."):::box
        Pi4B_Slave("Set the Pi 4B as the <b>Slave</b>."):::box
        Verify_Sync("<b>Verify Sync:</b> Ensure local zones and blocklists are appearing on both instances."):::box
        Tuning("<b>Blocklist Tuning:</b> Add your preferred lists <i>(e.g., OISD, HaGeZi)</i> and verify they are enabled on both."):::box
    end
    
    %% Connections (Phase_3)
    Enable_Clustering --> DebianVM_Master
    Enable_Clustering --> Pi4B_Slave
    DebianVM_Master --> Verify_Sync
    Pi4B_Slave --> Verify_Sync
    Verify_Sync --> Tuning
    Phase_3 ==> Phase_4
    
    subgraph Phase_4 ["<b>Phase 4</b>: Network Cutover"]
        direction TB
        DHCP("<b>Update Router DHCP:</b>"):::box
        DHCP_1("Point DNS 1 to the <b>Debian VM</b> IP."):::box
        DHCP_2("Point DNS 2 to the <b>Pi 4B</b> IP."):::box
        DHCP_3("<i>(Optional)</i> Point DNS 3 to the <b>Pi Zero</b> IP."):::box
        
        Clear_Cache("<b>Clear Local Caches:</b> Flush DNS on your main workstation"):::box
        Test_Resolution("<b>Test Resolution:</b> Run 'dig @[Primary-IP] google.com' and verify the [SERVER] field."):::box
    end
    
    %% Connections (Phase_4)
    DHCP --> DHCP_1
    DHCP --> DHCP_2
    DHCP --> DHCP_3
    DHCP_1 --> Clear_Cache
    DHCP_2 --> Clear_Cache
    Clear_Cache --> Test_Resolution
    Phase_4 ==> Phase_5
    
    subgraph Phase_5 ["<b>Phase 5:</b> Verification & Safety Net"]
        direction TB
        DoT_Status("<b>Check DoT Status:</b> Ensure upstream is encrypted."):::box
        Fallback("<b>Verify Pi Zero Fallback:</b> Temporarily stop the Technitium service on both the VM and Pi 4B. Confirm the Pi Zero Pi-hole takes over resolution."):::box
        Audit("<b>Audit</b> Dashboard:</b> Monitor the Technitium dashboard for any unexpected NXDOMAIN responses or high latency."):::box
    end
    
    %% Connections (Phase_5)
    DoT_Status --> Fallback
    Fallback --> Audit
```