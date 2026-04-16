---
icon: material/email-alert
title: Setup SSH Login Notification
hide:
  - toc
---
![material-email-alert icon](../assets/icons/email-alert.svg){ width=200 }

# Setup SSH Login Notification

---
## :material-package-variant: Install Required Packages

> [!info] Dependencies
> In order to send email notifications from a headless server we need to install the required packages. The `msmtp` package is a lightweight CLI utility for sending email using SMTP.

1. For **Debian / Ubuntu** based systems, execute:
    ```bash linenums="1"
    sudo apt install msmtp msmtp-mta bsd-mailx
    ```

2. For **Fedora / RHEL** based systems, execute: 
    ```bash linenums="1"
    sudo dnf install msmtp msmtp-mta mailx
    ```
---

## :material-email: Configure `msmtp` with Your Email Credentials 

> [!info] Config
> Now we need to create the configuration file for `msmtp` so that it can log into your email account with the proper SMTP server information to send email on your behalf.

1. Using the text editor of your choice *(e.g., nano)*, create a configuration file, `/etc/msmtprc`:

    ```bash linenums="1"
    sudo nano /etc/msmtprc
    ```

2. Paste the following into the configuration file:

    ```bash title="/etc/msmtprc" linenums="1" hl_lines="11 13-14"
    # Global defaults
    defaults
    auth           on
    tls            on
    tls_starttls   off  # (1)!   
    tls_trust_file /etc/ssl/certs/ca-certificates.crt
    syslog         on

    # Email account
    account        email
    host           smtp.example.com
    port           465
    from           example@example.com
    user           example@example.com
    passwordeval   "cat /root/.email_app_password"

    # Set default
    account default : email
    ```

    1. `starttls` may be required check your email provider's server settings. If it is set to `on`. 

3. Fill in the configuration file with your email address and the correct server information for your email provider. 
4. Save and close the `/etc/msmtprc` configuration file.
	+ ++ctrl+o++&ensp;++ctrl+x++
5. **Set restrictive permissions for the configuration file.** This file contains sensitive server information, so it must be readable only by root.

    ```bash linenums="1"
    sudo chmod 600 /etc/msmtprc
    sudo chown root:root /etc/msmtprc
    ```

6. Create the hidden file containing the app password for your email login in the **root** user's home directory. 

    >[!tip]+ 2FA / MFA 
    > If you have 2FA / MFA enabled on your email account, you will need to create a unique "App password."

    ```bash linenums="1"
    read -s -p "Enter your Email App Password: " EMAIL_PASS && sudo bash -c "echo $EMAIL_PASS > /root/.email_app_password" && echo
    ```

    >[!tip]+ Security Tip 
    > The `read -s` command is used here to securely enter the password without storing it in your shell history.

7. Set the required permissions for the `/root/.email_app_password` file. This is crucial for security, as this file contains the actual login credential.

    ```bash linenums="1"
    sudo chmod 600 /root/.email_app_password
    sudo chown root:root /root/.email_app_password
    ```

---

## :material-alert: Enable Login Alerts with PAM

> [!note] PAM
> **PAM** is the most effective way to fire a hook every time an SSH session opens or closes. When someone logs in with SSH, the system requests instructions from PAM. Usually, PAM checks passwords, keys, or 2FA, but we can also tell it: “Every time a new SSH session starts, run this script.”

1. Edit `/etc/pam.d/sshd` and add the following **after** the existing "session" lines:

    ```bash linenums="1" hl_lines="3"
    sudo -e /etc/pam.d/sshd  # (1)!
    
    session optional pam_exec.so /usr/local/bin/ssh-login-notify.sh  # (2)!
    ```

    1. Command to edit PAM config file.
    2. Add line to `/etc/pam.d/sshd` *after* the existing "session" lines.

    >[!warning] Warning! 
    > It is important to use `#!bash sudo -e` instead of a direct editor command *(like `sudo nano`)* when editing system configuration files. This ensures the file is checked for errors before it is saved, using the editor specified by your system's `$EDITOR` environment variable.

    The final file should look like this: 

    ```ini title="/etc/pam.d/sshd" linenums="1" hl_lines="26"
    # PAM configuration for the Secure Shell service
    # Standard Un*x authentication.
    @include common-auth

    # Disallow non-root logins when /etc/nologin exists.
    account    required     pam_nologin.so

    # Uncomment and edit /etc/security/access.conf if you need to set complex
    # access limits that are hard to express in sshd_config.
    # account  required     pam_access.so

    # Standard Un*x authorization.
    @include common-account

    # SELinux needs to be the first session rule.  This ensures that any
    # lingering context has been cleared.  Without this it is possible that a
    # module could execute code in the wrong domain.
    session [success=ok ignore=ignore module_unknown=ignore default=bad] pam_selinux.so  close

    # Set the loginuid process attribute.
    session    required     pam_loginuid.so

    # Create a new session keyring.
    session    optional     pam_keyinit.so force revoke

    session    optional     pam_exec.so /usr/local/bin/ssh-login-notify.sh
    ```

2. Save the file and exit.
	+ ++ctrl+o++&ensp;++ctrl+x++

---
## :material-file-code-outline: Creating the Shell Script 

> [!info] The Script
> Finally, it is time to create the shell script. The shell script is vital. It is what does all the work to send the email notification when you start an SSH session. It will use `msmtp` to log into your email provider's SMPT server using the configuration and password we provided earlier. The PAM, `pam_exec.so`, we configured for `sshd` will run this script every time a new SSH session begins.

1. Create the shell script file.

    ```bash linenums="1"
    sudo nano /usr/local/bin/ssh-login-notify.sh
    ```

2. Paste the following into your script file, and replace `example@example.com` with the email address to which you would like the notifications to be sent. 

    ```bash title="ssh-login-notify.sh" linenums="1" hl_lines="7"
    #!/bin/bash

    USER="$PAM_USER"
    IP="$PAM_RHOST"
    HOST=$(hostname)
    DATE=$(date)
    RECIPIENT="example@example.com"  # (1)!
    SUBJECT="SSH Login on $HOST"

    BODY="
    A new SSH session was successfully established.

    User:          ${USER}
    User IP Host:  ${IP}
    Date:          ${DATE}
    Server:        ${HOST}
    "

    if [ "${PAM_TYPE}" = "open_session" ]; then
        echo -e "Subject: ${SUBJECT}\n\n${BODY}" | msmtp -a default "${RECIPIENT}"
    fi

    exit 0
    ```

    1. Change `RECIPIENT=example@example.com` to your email address.  

3. Save and close the file.
	+ ++ctrl+o++&ensp;++ctrl+x++
4. Give execute permission to the script.

    ```bash linenums="1"
    sudo chmod +x /usr/local/bin/ssh-login-notify.sh
    ```

---

## :material-test-tube: Testing the Setup

> [!done] Congrats!
> Congratulations, we are done! You should now have a working email notification set up. You should now recieve an email notification every time a new SSH session is started on your server. Now we will test everything we have configured to make sure it is functioning properly. 

1. Start a new SSH session either on a new tab in your terminal application, or with a different host.
2. Check your recipient email account to see if the email has been sent.
3. If, for some reason, the email is not in your inbox, check your spam/junk folders. 
4. If the email is not in your spam/junk folders, check the logs to see what went wrong.

    ```bash linenums="1"
    journalctl -t msmtp
    ```

> [!NOTE]+ Troubleshooting Note
> *If the logs don't immediately indicate a problem, double-check the file permissions on the two sensitive configuration files.*
>
> + `/etc/msmtprc`: Must be owned by `root:root` and have permissions set to `600`.
> + `/root/.email_app_password`: Must be owned by `root:root` and have permissions set to `600`.

> [!TIP]+ Unattended Upgrades Notifications
> *To use the `msmpt` email account configuration with `unattended-upgrades` you need to add a 'Sender' line to the config file to avoid the following error:*
> > [!error] Error 551 5.7.1
> > *Not authorised to send from this header address.*
> 
> 1. Open the configuration file in a text editor: 
>     ```bash linenums="1"
>     sudo nano /etc/apt/apt.conf.d/50unattended-upgrades
>     ```
> 2. Find *(or add)* the `Sender` line and set it to your authorized email:
>     ```bash linenums="1"
>     Unattended-Upgrade::Sender "your-authorized-email@domain.com";
>     ```
> 3. Save and close the config file: 
>     + ++ctrl+o++&ensp;++ctrl+x++
> 4. Restart the `unattended-upgrades` Systemd service:
>     ```bash linenums="1"
>     sudo systemctl restart unattended-upgrades.service
>     ```
> 5. Test the fix:
>     ```bash linenums="1"
>     sudo unattended-upgrade --dry-run --debug
>     ```
