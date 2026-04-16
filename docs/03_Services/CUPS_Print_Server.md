---
icon: material/printer
tags:
  - active
  - service
  - software
  - printing
  - native
hide:
  - toc
---
![CUPS Open Print Server icon](../assets/icons/cups-service.svg){ width=200 }

# CUPS Print Server
[GitHub :material-github:](https://github.com/OpenPrinting/cups){ .md-button .md-button--primary }&emsp;[Documentation :material-file-document-multiple:](https://openprinting.github.io/cups/#DOCUMENTATION){ .md-button }

---
## :material-information-outline: Overview

#### :material-comment-eye-outline: Description: 
+ Print server for `Brother_HL-L2300D_series` laser printer.

#### :symbols-settings-ethernet: Port(s): 
+ `631`

#### :material-protocol: URL / Access: 
+ <http://pi-server.internal:631>
+ <http://192.168.50.2:631>

#### :material-printer-settings: Printer URL: 
+ IPP:
    + `ipp://pi-server.local:631/printers/Brother_HL-L2300D_series`
+ Bonjour:
    + `dnssd://Brother%20Laser%20Printer%20%40%20pi-server._ipp._tcp.local/cups?uuid=06d625d5-f736-30c6-6315-c20eec2f460e`

#### :material-key-chain: Credentials: 
+ [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): "CUPS Server"&ensp;:material-information-outline:{ title="Login needed for Administration, but anyone on the local network can print." }

## :material-package-down: Deployment Details

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-raspberry-pi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-linux:&nbsp;Native Linux | `N/A` | `N/A` |

### :material-cog: Configuration 

```apacheconf title="cupsd.conf" linenums="1"
LogLevel warn  
PageLogFormat  
MaxLogSize 1m  
ErrorPolicy retry-job  
Port 631  
Listen /run/cups/cups.sock  
Browsing On  
BrowseLocalProtocols dnssd  
DefaultAuthType Basic  
WebInterface Yes  
IdleExitTimeout 60  
<Location />  
 Order allow,deny  
 Allow all  
</Location>  
<Location /admin>  
 AuthType Default  
 Require user @SYSTEM  
</Location>  
<Location /admin/conf>  
 AuthType Default  
 Require user @SYSTEM  
</Location>  
<Location /admin/log>  
 AuthType Default  
 Require user @SYSTEM  
</Location>  
<Policy default>  
 JobPrivateAccess default  
 JobPrivateValues default  
 SubscriptionPrivateAccess default  
 SubscriptionPrivateValues default  
 <Limit Create-Job Print-Job Print-URI Validate-Job>  
   Order deny,allow  
 </Limit>  
 <Limit Send-Document Send-URI Hold-Job Release-Job Restart-Job Purge-Jobs Set-Job-Attributes Create-Job-Subscription Renew-Subscription Ca  
ncel-Subscription Get-Notifications Reprocess-Job Cancel-Current-Job Suspend-Current-Job Resume-Job Cancel-My-Jobs Close-Job CUPS-Move-Job>  
   Require user @OWNER @SYSTEM  
   Order deny,allow  
 </Limit>  
 <Limit CUPS-Get-Document>  
   AuthType Default  
   Require user @OWNER @SYSTEM  
   Order deny,allow  
 </Limit>  
 <Limit CUPS-Add-Modify-Printer CUPS-Delete-Printer CUPS-Add-Modify-Class CUPS-Delete-Class CUPS-Set-Default CUPS-Get-Devices>  
   AuthType Default  
   Require user @SYSTEM  
   Order deny,allow  
 </Limit>  
 <Limit Pause-Printer Resume-Printer Enable-Printer Disable-Printer Pause-Printer-After-Current-Job Hold-New-Jobs Release-Held-New-Jobs Dea  
ctivate-Printer Activate-Printer Restart-Printer Shutdown-Printer Startup-Printer Promote-Job Schedule-Job-After Cancel-Jobs CUPS-Accept-Job  
s CUPS-Reject-Jobs>  
   AuthType Default  
   Require user @SYSTEM  
   Order deny,allow  
 </Limit>  
 <Limit Cancel-Job>  
   Require user @OWNER @SYSTEM  
   Order deny,allow  
 </Limit>  
 <Limit CUPS-Authenticate-Job>  
   AuthType Default  
   Require user @OWNER @SYSTEM  
   Order deny,allow  
 </Limit>  
 <Limit All>  
   Order deny,allow  
 </Limit>  
</Policy>  
<Policy authenticated>  
 JobPrivateAccess default  
 JobPrivateValues default  
 SubscriptionPrivateAccess default  
 SubscriptionPrivateValues default  
 <Limit Create-Job Print-Job Print-URI Validate-Job>  
   AuthType Default  
   Order deny,allow  
 </Limit>  
 <Limit Send-Document Send-URI Hold-Job Release-Job Restart-Job Purge-Jobs Set-Job-Attributes Create-Job-Subscription Renew-Subscription Ca  
ncel-Subscription Get-Notifications Reprocess-Job Cancel-Current-Job Suspend-Current-Job Resume-Job Cancel-My-Jobs Close-Job CUPS-Move-Job C  
UPS-Get-Document>  
   AuthType Default  
   Require user @OWNER @SYSTEM  
   Order deny,allow  
 </Limit>  
 <Limit CUPS-Add-Modify-Printer CUPS-Delete-Printer CUPS-Add-Modify-Class CUPS-Delete-Class CUPS-Set-Default>  
   AuthType Default  
   Require user @SYSTEM  
   Order deny,allow  
 </Limit>  
 <Limit Pause-Printer Resume-Printer Enable-Printer Disable-Printer Pause-Printer-After-Current-Job Hold-New-Jobs Release-Held-New-Jobs Dea  
ctivate-Printer Activate-Printer Restart-Printer Shutdown-Printer Startup-Printer Promote-Job Schedule-Job-After Cancel-Jobs CUPS-Accept-Job  
s CUPS-Reject-Jobs>  
   AuthType Default  
   Require user @SYSTEM  
   Order deny,allow  
 </Limit>  
 <Limit Cancel-Job CUPS-Authenticate-Job>  
   AuthType Default  
   Require user @OWNER @SYSTEM  
   Order deny,allow  
 </Limit>  
 <Limit All>  
   Order deny,allow  
 </Limit>  
</Policy>  
<Policy kerberos>  
 JobPrivateAccess default  
 JobPrivateValues default  
 SubscriptionPrivateAccess default  
 SubscriptionPrivateValues default  
 <Limit Create-Job Print-Job Print-URI Validate-Job>  
   AuthType Negotiate  
   Order deny,allow  
 </Limit>  
 <Limit Send-Document Send-URI Hold-Job Release-Job Restart-Job Purge-Jobs Set-Job-Attributes Create-Job-Subscription Renew-Subscription Ca  
ncel-Subscription Get-Notifications Reprocess-Job Cancel-Current-Job Suspend-Current-Job Resume-Job Cancel-My-Jobs Close-Job CUPS-Move-Job C  
UPS-Get-Document>  
   AuthType Negotiate  
   Require user @OWNER @SYSTEM  
   Order deny,allow  
 </Limit>  
 <Limit CUPS-Add-Modify-Printer CUPS-Delete-Printer CUPS-Add-Modify-Class CUPS-Delete-Class CUPS-Set-Default>  
   AuthType Default  
   Require user @SYSTEM  
   Order deny,allow  
 </Limit>  
 <Limit Pause-Printer Resume-Printer Enable-Printer Disable-Printer Pause-Printer-After-Current-Job Hold-New-Jobs Release-Held-New-Jobs Dea  
ctivate-Printer Activate-Printer Restart-Printer Shutdown-Printer Startup-Printer Promote-Job Schedule-Job-After Cancel-Jobs CUPS-Accept-Job  
s CUPS-Reject-Jobs>  
   AuthType Default  
   Require user @SYSTEM  
   Order deny,allow  
 </Limit>  
 <Limit Cancel-Job CUPS-Authenticate-Job>  
   AuthType Negotiate  
   Require user @OWNER @SYSTEM  
   Order deny,allow  
 </Limit>  
 <Limit All>  
   Order deny,allow  
 </Limit>  
</Policy>  
BrowseWebIF Yes
```
