---
icon: material/console-network
tags:
  - active
  - service
  - software
  - native
  - remote-access
  - shell
  - infrastructure
hide:
  - toc
---
![Material Design ssh icon](../assets/icons/ssh.svg){ width=300 }

# [[SSH|SSH (Secure Shell)]]
[Documentation :material-file-document-multiple:](https://www.openssh.org/manual.html){ .md-button .md-button--primary }

---
## :material-information-outline: Overview

#### Purpose:
+ Remote shell access to servers

#### Port(s):
+ `22`

#### URL / Access: 
* :material-router-wireless:&nbsp;[ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md)
    * `192.168.50.1:22` 
    * `asusrouter.internal:22`
* :material-debian:&nbsp;[Debian Server VM](../02_Hardware/Debian_Server_VM.md)
    * `192.168.50.6:22` 
    * `debian-vm.internal:22` 
* :simple-raspberrypi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md)
    * `192.168.50.2:22` 
    * `pi-server.internal:22`
* :simple-raspberrypi:&nbsp;[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md)
    * `192.168.50.3:22` 
    * `pi-zero.internal:22` 
* :services-zimaos:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md)
    * `192.168.50.4:22` 
    * `storage-server.internal:22` 
* :devices-creality:&nbsp;[Kacey (Creality^&copy;^ K1C) 3D-Printer](../02_Hardware/Kacey_3D-printer.md)
    * `192.168.50.153:22` 
    * `k1c-a71e.internal:22` 

#### Credentials: 
* [:services-bitwarden:&nbsp;Bitwarden](https://vault.bitwarden.com): SSH keys

## :material-package-down: Deployment Details  

| Host Device | Method | Container Name | Image |
| :---------- | :----- | :------------- | :---- |
| :material-router-wireless:&nbsp;[ASUS RT-BE92U](../02_Hardware/ASUS_RT-BE92U.md) | :material-linux:&nbsp;Native Linux | `N/A` | `N/A` |
| :material-debian:&nbsp;[Debian Server VM](../02_Hardware/Debian_Server_VM.md) | :material-linux:&nbsp;Native Linux | `N/A` | `N/A` |
| :simple-raspberrypi:&nbsp;[Raspberry Pi 4B Server](../02_Hardware/Raspberry_Pi_4B_Server.md) | :material-linux:&nbsp;Native Linux | `N/A` | `N/A` |
| :simple-raspberrypi:&nbsp;[Raspberry Pi Zero Server](../02_Hardware/Raspberry_Pi_Zero_2_W.md) | :material-linux:&nbsp;Native Linux | `N/A` | `N/A` |
| :services-zimaos:&nbsp;[ZimaOS NAS](../02_Hardware/ZimaBoard_2_NAS.md) | :material-linux:&nbsp;Native Linux | `N/A` | `N/A` |
| :devices-creality:&nbsp;[Kacey (Creality^&copy;^ K1C) 3D-Printer](../02_Hardware/Kacey_3D-printer.md) | :material-linux:&nbsp;Native Linux | `N/A` | `N/A` |

## :material-cog: Configuration 

### :material-server: Servers:

#### SSH Config File:

1. Make the required changes to the SSH config file: 

    ```conf title="/etc/ssh/sshd_config" linenums="1"
    # This is the sshd server system-wide configuration file.  See  
    # sshd_config(5) for more information.  
  
    # This sshd was compiled with PATH=/usr/local/bin:/usr/bin:/bin:/usr/games  
  
    # The strategy used for options in the default sshd_config shipped with  
    # OpenSSH is to specify options with their default value where  
    # possible, but leave them commented.  Uncommented options override the  
    # default value.  
  
    Include /etc/ssh/sshd_config.d/*.conf  
  
    #Port 22  
    #AddressFamily any  
    #ListenAddress 0.0.0.0  
    #ListenAddress ::  
  
    #HostKey /etc/ssh/ssh_host_rsa_key  
    #HostKey /etc/ssh/ssh_host_ecdsa_key  
    #HostKey /etc/ssh/ssh_host_ed25519_key  
  
    # Ciphers and keying  
    #RekeyLimit default none  
  
    # Logging  
    SyslogFacility AUTH  
    LogLevel INFO  
  
    # Authentication:  
  
    LoginGraceTime 2m  
    PermitRootLogin no  
    StrictModes yes  
    MaxAuthTries 10  
    MaxSessions 10  
  
    #PubkeyAuthentication yes  
  
    # Expect .ssh/authorized_keys2 to be disregarded by default in future.  
    #AuthorizedKeysFile     .ssh/authorized_keys .ssh/authorized_keys2  
  
    #AuthorizedPrincipalsFile none  
  
    #AuthorizedKeysCommand none  
    #AuthorizedKeysCommandUser nobody  
  
    # For this to work you will also need host keys in /etc/ssh/ssh_known_hosts  
    #HostbasedAuthentication no  
    # Change to yes if you don't trust ~/.ssh/known_hosts for  
    # HostbasedAuthentication  
    #IgnoreUserKnownHosts no  
    # Don't read the user's ~/.rhosts and ~/.shosts files  
    #IgnoreRhosts yes  
  
    # To disable tunneled clear text passwords, change to "no" here!  
    PasswordAuthentication no  
    #PermitEmptyPasswords no  
  
    # Change to "yes" to enable keyboard-interactive authentication.  Depending on  
    # the system's configuration, this may involve passwords, challenge-response,  
    # one-time passwords or some combination of these and other methods.  
    # Beware issues with some PAM modules and threads.  
    KbdInteractiveAuthentication no  
  
    # Kerberos options  
    #KerberosAuthentication no  
    #KerberosOrLocalPasswd yes  
    #KerberosTicketCleanup yes  
    #KerberosGetAFSToken no  
  
    # GSSAPI options  
    #GSSAPIAuthentication no  
    #GSSAPICleanupCredentials yes  
    #GSSAPIStrictAcceptorCheck yes  
    #GSSAPIKeyExchange no  
  
    # Set this to 'yes' to enable PAM authentication, account processing,  
    # and session processing. If this is enabled, PAM authentication will  
    # be allowed through the KbdInteractiveAuthentication and  
    # PasswordAuthentication.  Depending on your PAM configuration,  
    # PAM authentication via KbdInteractiveAuthentication may bypass  
    # the setting of "PermitRootLogin prohibit-password".  
    # If you just want the PAM account and session checks to run without  
    # PAM authentication, then enable this but set PasswordAuthentication  
    # and KbdInteractiveAuthentication to 'no'.  
    UsePAM yes  
  
    AllowAgentForwarding no  
    AllowTcpForwarding no  
    #GatewayPorts no  
    X11Forwarding no  
    #X11DisplayOffset 10  
    #X11UseLocalhost yes  
    #PermitTTY yes  
    PrintMotd no  
    #PrintLastLog yes  
    #TCPKeepAlive yes  
    #PermitUserEnvironment no  
    #Compression delayed  
    ClientAliveInterval 300  
    ClientAliveCountMax 3  
    #UseDNS no  
    #PidFile /run/sshd.pid  
    MaxStartups 10:30:60  
    #PermitTunnel no  
    #ChrootDirectory none  
    #VersionAddendum none  
  
    # no default banner path  
    Banner /etc/issue.net  
  
    # Allow client to pass locale and color environment variables  
    AcceptEnv LANG LC_* COLORTERM NO_COLOR  
  
    # override default of no subsystems  
    Subsystem       sftp    /usr/lib/openssh/sftp-server  
  
    # Example of overriding settings on a per-user basis  
    #Match User anoncvs  
    #       X11Forwarding no  
    #       AllowTcpForwarding no  
    #       PermitTTY no  
    #       ForceCommand cvs server
    ```

2. Restart the SSH service for the change to take effect:

    ```bash linenums="1"
    sudo systemctl restart sshd
    ```

#### Login Banner:

1. Paste this ASCII message into the banner file:

    ```text title="/etc/issue.net" linenums="1"
    /////---------------------------------------------------------------/////  
    \\\\\                                                               \\\\\  
    ///// WARNING: This system is for the use of authorized users only! /////  
    \\\\\   All activities on this system are monitored and recorded.   \\\\\  
    /////   Unauthorized access is prohibited and will be prosecuted.   /////  
    \\\\\   Disconnect immediately if you are not an authorized user.   \\\\\  
    /////                                                               /////  
    \\\\\---------------------------------------------------------------\\\\\
    ```

#### Suppress MOTD:

> [!warning inline end] Warning
> `truncate -s 0` is safer than `> /etc/motd` as it preserves permissions if the file doesn't exist.

1. Run this command to clear MOTD file:

    ```bash linenums="1"
    sudo truncate -s 0 /etc/motd
    ```

#### Suppress Dynamic MOTD:

1. See what dynamic MOTD scripts exist:

    ```bash linenums="1"
    ls -l /etc/update-motd.d/
    ```

2. Remove executable permission for unwanted scripts:

    ```bash linenums="1"
    sudo chmod -x /etc/update-motd.d/SCRIPT_TO_REMOVE
    ```

3. To re-enable a script give it execute permission again:

    ```bash linenums="1"
    sudo chmod +x /etc/update-motd.d/SCRIPT_TO_ENABLE
    ```

#### Suppress Last Login: 

1. Open the SSH config file with a text editor:

    ```bash linenums="1"
    sudo nano /etc/ssh/sshd_config
    ```

2. Find the line, `PrintLastLog yes`, and change it to `PrintLastLog no`. 
3. Restart the SSH service for the change to take effect:

    ```bash linenums="1"
    sudo systemctl restart sshd
    ```

> [!important]
> Don't forget to paste the **public key** in a text file for passwordless login:
> 
> ```bash
> nano ~/.ssh/authorized_keys
> ```

> [!tip] Don't Forget!
> + **ZimaOS** does not have SSH enabled after a fresh install. For the [[ZimaBoard_2_NAS|ZimaBoard 2 NAS]] the SSH service needs to be enabled first through the [ZimaOS Web UI](http://storage-server.internal/) in the developer options.
>     + Settings :material-arrow-right-thin: General :material-arrow-right-thin: Developer Mode :material-arrow-right-thin: SSH Access 
>     
>         ![[zimaos_ssh.png|600]]
>         
> + After enabling SSH in the developer options the [[ttydBridge]] application is automatically installed. The SSH service can be configured from there.
> + Once the SSH server is configured the **ttydBridge** application is no longer needed, but remains installed. This is a good backup to get shell access in case of an SSH configuration issue.

> [!help] Email Notification
> The SSH servers on the network have email login notifications configured to notify in the case of unwanted access.<br>
> More information regarding setup and configuration can be found [[Setup_SSH_Login_Email_Notification|here]].

### :material-devices: Clients:

#### Bitwarden SSH Key Agent:

1. Paste this line into the client's `~/.bashrc` file to enable the Bitwarden SSH key agent.

    ```bash linenums="1"
    export SSH_AUTH_SOCK=/home/$USER/.bitwarden-ssh-agent.sock
    ```

#### Client SSH Configuration:

1. Create the `~/.ssh` directory:

    ```bash linenums="1"
    mkdir -p ~/.ssh
    ```

2. Create the config file:

    ```bash linenums="1"
    nano ~/.ssh/config
    ```

3. Paste the following into the config file:

    ```conf title="~/.ssh/config" linenums="1"
    # --- GLOBAL SETTINGS for all hosts (*) ---

	# All hosts use Bitwarden SSH key agent
	Host *
		IdentityAgent ~/.bitwarden-ssh-agent.sock
	    # Assume 'admin' is the user for all hosts
	    #User admin

	# --- HOST-SPECIFIC SETTINGS ---

	Host pi-server.internal
		User admin
		IdentityFile ~/.ssh/pi-server.pub
		# -- CRITICAL: Prevents offering all other keys stored in Bitwarden --
		IdentitiesOnly yes

	Host pi-zero.internal
		User admin
		IdentityFile ~/.ssh/pi-zero.pub
		IdentitiesOnly yes

	Host asusrouter.internal
		User Admin
		IdentityFile ~/.ssh/asusrouter.pub
		IdentitiesOnly yes

	Host storage-server.internal
		User admin
		IdentityFile ~/.ssh/storage-server.pub
		IdentitiesOnly yes

	Host debian-vm.internal
		User server-admin
		IdentityFile ~/.ssh/debian-vm.pub
		IdentitiesOnly yes

	Host k1c-a71e.internal
		User root
		IdentityFile ~/.ssh/k1c-a71e.pub
		IdentitiesOnly no
    ```

4. Create the `IdentityFile` for all of the servers in the `~/.ssh` directory and paste in the public key.
    * **Example:**

        ```bash linenums="1"
        nano ~/.ssh/[hostname].pub
        ```
