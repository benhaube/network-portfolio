---
icon: symbols/rotate-cw-clock
title: Auto Updates for Debian
subtitle: Using Unattended-Upgrades
description: A comprehensive guide to using and configuring 'unattended-upgrades' on Debian Linux.
tags:
  - Linux
  - PC
  - Security
  - Server
  - Software
  - Tools
hide:
  - toc
---

![Custom update icon derived from Lucide history icon](../assets/icons/rotate-cw-clock.svg){ width=200 }

# Automatic Updates for Debian

_Using Unattended-Upgrades_

!!! question "FAQ"

    **What Are Unattended-Upgrades?**
    : The [<code>unattended-upgrades</code>](https://packages.debian.org/stable/unattended-upgrades){ external-link } package enables automatic security patches and critical software updates on your Debian server with no manual intervention required by the system administrator. This helps to protect your server from new CVE attack vectors, ensures bug fixes are applied quickly during maintenance windows, and relieves burden from patch management, allowing the system administrator to focus on other things. By the end of this tutorial, you will have `unattended-upgrades` configured with Systemd timers, custom origin settings, email notifications, automatic reboot scheduling, and dedicated logging to monitor all upgrade activity.

???+ note

    :symbols-git-branch:&ensp;**Relevant Versions:**
    : This tutorial applies to **Debian 13** _(Trixie)_, **Debian 12** _(Bookworm)_, and **Debian 11** _(Bullseye)_. The command output examples are based on **Debian 13** _(Trixie)_, and your output may vary based on your version. However, the commands should work identically on all supported versions of Debian.

---

## :symbols-monitor-arrow-down-corner:&ensp;Install the Packages

!!! note inline end

    :symbols-package-search:&ensp;**Minimal & Server Installs:**
    : A full Debian install will probably have this package installed by default, however, server and minimal installs may not, and will require installing the package with the command above.

1.  Update the package index:

    ``` bash linenums="1"
    sudo apt update && sudo apt upgrade -y 
    ```

2.  Install the `unattended-upgrades` package:

    ``` bash linenums="1"
    sudo apt install unattended-upgrades
    ```

### Install Optional Packages

There are two optional packages you can install to extend the functionality of `unattended-upgrades`.

1.  `apt-config-auto-update`

    + Enables automatic reboots when packages that require a reboot are updated.
    + Useful for servers that can tolerate scheduled downtime.
    + Works in conjunction with `Automatic-Reboot` configuration options.

        ``` bash linenums="1"
        sudo apt install apt-config-auto-update -y
        ```

2.  `powermgmt-base`

    + Provides power management detection for battery-powered devices. _(e.g., laptops)_
    + Enables the `OnlyOnACPower` setting, skipping updates when on battery power.
    + Recommended for all portable devices, but not for desktop PCs and servers that have continuous AC power.

        ``` bash linenums="1"
        sudo apt install powermgmt-base -y
        ```

## :symbols-badge-check:&ensp;Verify the Installation

1.  Run a 'dry-run' test to confirm the package is working and to see which origins are allowed:

    ``` bash linenums="1"
    sudo unattended-upgrades --dry-run --debug
    ```

2.  Check the command output for allowed origins and to see what packages would have been updated:

    ``` shell-session title="Expected Output" linenums="1"
    Starting unattended upgrades script
    Allowed origins are: origin=Debian,codename=trixie,label=Debian, origin=Debian,codename=trixie,label=Debian-Security, origin=Debian,codename=trixie-security,label=Debian-Security
    Initial blacklist:
    Initial whitelist (not strict):
    Packages that will be upgraded: base-files bash libc-bin libc6 libcap2
    All upgrades installed
    ```

    ???+ note

        :symbols-binoculars:&ensp;**What to Look For:**
        : The command output will show the codename for your version of Debian _(bullseye, bookworm, or trixie)_. and depending on what needs to be upgraded you may see different packages. The important things to look for are "Allowed origins" matching your release name, and "All upgrades installed."

## :symbols-timer:&ensp;Manage the Systemd Timers

Instead of using cron jobs, the `unattended-upgrades` package relies on Systemd timers to schedule the automatic updates. There are two timers that work together to handle updating the system's packages.

1.  `apt-daily.timer`

    - Runs two times per day at 6:00 and 18:00.
    - Downloads the latest package lists and new packages.
    - Has a built-in, randomized delay of up to 12-hours to distribute load across the mirrored servers.

2.  `apt-daily-upgrade.timer`

    - Runs daily at 6:00
    - Installs the previously downloaded security updates via `unattended-upgrades`.
    - Has a built-in, randomized delay of up to 60-minutes.

### Check the Timer Status

1.  Check the status of `apt-daily.timer`:

    ``` bash linenums="1"
    systemctl status apt-daily.timer
    ```

    ``` shell-session title="Expected Output" linenums="1"
    ● apt-daily.timer - Daily apt download activities
         Loaded: loaded (/usr/lib/systemd/system/apt-daily.timer; enabled; preset: enabled)
         Active: active (waiting) since Fri 2026-01-23 12:44:18 EST; 3 months 23 days ago
     Invocation: 5e43de1d27864e2a8228d94d709a8a93
        Trigger: Mon 2026-05-18 21:29:27 EDT; 5h 42min left
       Triggers: ● apt-daily.service

    Jan 23 12:44:18 pi-server systemd[1]: Started apt-daily.timer - Daily apt download activities.
    ```

2.  Check the status of `apt-daily-upgrade.timer`:

    ``` bash linenums="1"
    systemctl status apt-daily-upgrade.timer
    ```

    ``` shell-session title="Expected Output" linenums="1"
    ● apt-daily-upgrade.timer - Daily apt upgrade and clean activities
         Loaded: loaded (/usr/lib/systemd/system/apt-daily-upgrade.timer; enabled; preset: enabled)
         Active: active (waiting) since Fri 2026-01-23 12:44:18 EST; 3 months 23 days ago
     Invocation: a59a98acd1eb49e9a650fe141259046b
        Trigger: Tue 2026-05-19 06:25:05 EDT; 14h left
       Triggers: ● apt-daily-upgrade.service

    Jan 23 12:44:18 pi-server systemd[1]: Started apt-daily-upgrade.timer - Daily apt upgrade and clean activities.
    ```

3.  View the next scheduled timers:

    ``` bash linenums="1"
    systemctl list-timers apt-daily*
    ```

    ``` shell-session title="Expected Output" linenums="1"
    NEXT                         LEFT LAST                              PASSED UNIT                    ACTIVATES
    ----------------------------------------------------------------------------------------------------------------------------                
    Tue 2026-05-19 11:57:20 EDT 45min Mon 2026-05-18 21:29:30 EDT      13h ago apt-daily.timer         apt-daily.service
    Wed 2026-05-20 06:13:41 EDT   19h Tue 2026-05-19 06:25:12 EDT 4h 46min ago apt-daily-upgrade.timer apt-daily-upgrade.service
    ```

## :symbols-tux:&ensp;Manage the Systemd Service

The `unattended-upgrades` service is a 'shutdown helper', meaning it ensures the upgrades are complete before the system powers off. Below is a table containing common Systemd service management commands.

| Action { data-sort-method="none" } | Command { data-sort-method="none" }          |
| :--------------------------------- | :------------------------------------------- |
| Check service status               | `systemctl status unattended-upgrades`       |
| Stop the service                   | `sudo systemctl stop unattended-upgrades`    |
| Start the service                  | `sudo systemctl start unattended-upgrades`   |
| Disable on boot                    | `sudo systemctl disable unattended-upgrades` |
| Enable on boot                     | `sudo systemctl enable unattended-upgrades`  |
| Restart the service                | `sudo systemctl restart unattended-upgrades` |

## :symbols-terminal:&ensp;CLI Options

Below is a table containing the options included with the `unattended-upgrade` command. You can also see the options by checking the [manual page](https://manpages.debian.org/trixie/unattended-upgrades/unattended-upgrade.8.en.html){ external-link } using the command: `#!bash man unattended-upgrade`

???+ note inline end

    You can use the options, `--dry-run` and `--debug`, after making configuration changes to verify your settings are working properly before deploying and relying on the automatic updates.

| Option { data-sort-method="none" } | Description { data-sort-method="none" }                                       |
| :--------------------------------- | :---------------------------------------------------------------------------- |
| `-h`, `--help`                     | Print the 'help' message and exit.                                            |
| `-d`, `--debug`                    | Print debug messages.                                                         |
| `--apt-debug`                      | Make apt/libapt print verbose debug messages.                                 |
| `-v`, `--verbose`                  | Print info messages.                                                          |
| `--dry-run`                        | Simulation, download but do not install.                                      |
| `--download-only`                  | Only download, do not even try to install.                                    |
| `--minimal-upgrade-steps`          | Upgrade in minimal steps (and allow interrupting with `SIGTERM`). _(default)_ |
| `--no-minimal-upgrade-steps`       | Upgrade all packages together instead of in smaller sets.                     |

## :symbols-file-cog:&ensp;Configure Unattended-Upgrades

The configuration file, `/etc/apt/apt.conf.d/50unattended-upgrades`, dictates which packages get upgraded automatically, notification settings, reboot behavior, and logging. Editing this configuration file allows you to customize all of these features. The file uses the `apt` syntax, meaning the comment characters, `//`, in front of an option will disable that option. In order to enable the option, remove those leading characters.  

1.  Make a backup of the original configuration file:

    ``` bash linenums="1"
    sudo cp /etc/apt/apt.conf.d/50unattended-upgrades{,.bak}
    ```

2.  Edit the configuration file:

    ``` bash linenums="1"
    sudo nano /etc/apt/apt.conf.d/50unattended-upgrades
    ```

### Configure Origins

The `Origins-Pattern` section of the configuration file dictates which repositories are eligible for automatic updates. By default, only security updates are allowed to apply automatically. You can uncomment the other included origins to enable additional repositories.

???+ note inline end

    The variable, `${distro_codename}`, automatically expands to your Debian release _(Bullseye, Bookworm, or Trixie)_. This makes the configuration portable across versions.

``` cpp { .mono-title title="/etc/apt/apt.conf.d/50unattended-upgrades" linenums="1" }
Unattended-Upgrade::Origins-Pattern {
    //  (1)!
//  "origin=Debian,codename=${distro_codename}-updates";
    //  (2)!
//  "origin=Debian,codename=${distro_codename}-proposed-updates"; 
    "origin=Debian,codename=${distro_codename},label=Debian";
    "origin=Debian,codename=${distro_codename},label=Debian-Security";
    "origin=Debian,codename=${distro_codename}-security,label=Debian-Security";
    //  (3)!
//  "o=Debian Backports,n=${distro_codename}-backports,l=Debian Backports"; 
};
```

1. Enable stable updates _(point releases)_.
2. Enable proposed updates _(testing before point release)_.
3. Enable backports _(newer software versions)_.

### Exclude Packages

The `Package-Blacklist` section uses Python regular expressions to exclude specific packages from automatic upgrades.

1.  Here are some examples:

    ``` cpp { .mono-title title="/etc/apt/apt.conf.d/50unattended-upgrades" linenums="1" }
    Unattended-Upgrade::Package-Blacklist {
        "linux-";  // (1)!
    //  "libc6$";  (2)
    //  "libc6-dev$";
    //  "libc6-i686$";
    //  "libstdc\+\+6$";  (3)
    //  "(lib)?xen(store)?";  (4)
        "mysql-server";  // (5)! 
        "postgresql";
    };
    ```

    1. Matches all packages starting with `linux-`. _(e.g., Linux Kernel packages)_
    2. Use `$` to explicitly define the end of a package name. Without the `$`, "`libc6`" would match all of them.
    3. Special characters need escaping.
    4. The following matches packages like `xen-system-amd64`, `xen-utils-4.1`, `xenstore-utils` and `libxenstore3.0`. Prevents updating core system libraries that could affect running applications.
    5. Prevents automatic updates to database servers that need coordinated maintenance windows.

### Email Notifications

!!! note inline end

    Email notifications require a working MTA on your system. I usually prefer the `msmtp` package for configuring SMTP email servers. You can see more detailed configuration information on my other tutorial, [Setup SSH Login Notification](setup_ssh_login_notification.md).

There are three main options to control email behavior.

1.  Setup email alerts to monitor upgrade activity:

    ``` cpp { .mono-title title="/etc/apt/apt.conf.d/50unattended-upgrades" linenums="1" }
    Unattended-Upgrade::Mail "admin@example.com";
    Unattended-Upgrade::MailReport "on-change";
    Unattended-Upgrade::Sender "your-authorized-email@example.com";
    ```

The `MailReport` option has three possible values:

- `always`:&ensp;Sends email after every `unattended-upgrades` run.
{ .no-bullets }
- `only-on-error`:&ensp;Sends email only when upgrades fail.
{ .no-bullets }
- `on-change`:&ensp;Sends email when packages are upgraded or errors occur.
{ .no-bullets }

### Automatic Reboots

Some updates require a system reboot to take effect _(e.g., kernel, libc, systemd)_. When a reboot is required for upgrades to take effect, the system creates this file: `/var/run/reboot-required`

1.  These options control automatic reboot behavior:

    ``` cpp { .mono-title title="/etc/apt/apt.conf.d/50unattended-upgrades" linenums="1" }
    Unattended-Upgrade::Automatic-Reboot "true";  // (1)!
    Unattended-Upgrade::Automatic-Reboot-WithUsers "true";  // (2)!
    Unattended-Upgrade::Automatic-Reboot-Time "03:00";  // (3)!
    ```

    1. Enable automatic reboot when required.
    2. Reboot even if users are logged in.
    3. Schedule reboot at a specific time instead of immediately.

2.  Check for pending reboots:

    ``` bash linenums="1"
    cat /var/run/reboot-required 2>/dev/null || echo "No reboot required"
    ```

### Dependency Cleanup

1.  Control whether `unattended-upgrades` removes orphaned packages automatically:

    ``` cpp { .mono-title title="/etc/apt/apt.conf.d/50unattended-upgrades" linenums="1" }
    Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";  // (1)!
    Unattended-Upgrade::Remove-New-Unused-Dependencies "true";  // (2)!
    Unattended-Upgrade::Remove-Unused-Dependencies "false";  // (3)!
    ```

    1. Remove unused kernel packages after upgrade.
    2. Remove dependencies that became unused after this upgrade.
    3. Remove all unused dependencies _(like apt autoremove)_.

### Logging

1.  Configure the method `unattended-upgrades` uses to log activity:

    ``` cpp { .mono-title title="/etc/apt/apt.conf.d/50unattended-upgrades" linenums="1" }
    Unattended-Upgrade::SyslogEnable "true";  // (1)!
    Unattended-Upgrade::SyslogFacility "daemon";  // (2)!
    Unattended-Upgrade::Verbose "true";  // (3)!
    Unattended-Upgrade::Debug "false";  // (4)!
    ```

    1. Enable syslog logging. _(default: false)_
    2. Syslog facility _(default: `daemon`)_
    3. Enable verbose output in logs.
    4. Enable debug output. _(very detailed)_

### Power & Network

These options are intended for laptops and metered internet connections.

1.  Prevent upgrades in unfavorable conditions:

    ``` cpp { .mono-title title="/etc/apt/apt.conf.d/50unattended-upgrades" linenums="1" }
    Unattended-Upgrade::OnlyOnACPower "true";  // (1)!
    Unattended-Upgrade::Skip-Updates-On-Metered-Connections "true";  // (2)!
    Acquire::http::Dl-Limit "500";  // (3)!
    ```

    1. Only upgrade when connected to AC power. _(requires `powermgmt-base`)_
    2. Skip updates on metered connections.
    3. Limit download bandwidth in KB/s.

### Additional Options

!!! note inline end

    Enabling `Allow-Downgrade` has been known to cause system instability. This option should only be used when you have a specific need. _(e.g., rolling back a problematic upgrade)_

Other useful settings in the configuration file:

``` cpp { .mono-title title="/etc/apt/apt.conf.d/50unattended-upgrades" linenums="1" }
Unattended-Upgrade::AutoFixInterruptedDpkg "true";  // (1)!
Unattended-Upgrade::MinimalSteps "true";  // (2)!
Unattended-Upgrade::InstallOnShutdown "false";  // (3)!
Unattended-Upgrade::Allow-downgrade "false";  // (4)!
```

1. Automatically fix interrupted `dpkg`. _(default: true)_
2. Install upgrades in minimal steps for `SIGTERM` interruption. _(default: true)_
3. Install upgrades during shutdown instead of in background.
4. Allow package downgrades if pin priority exceeds 1000.

### Test Configuration Changes

It is highly recommended to do a 'dry-run' after making changes to the configuration.

1.  Run the following command to do a `dry-run`:

    ``` bash linenums="1"
    sudo unattended-upgrades --dry-run --debug
    ```

## :symbols-text-search:&ensp;Monitor Upgrade Logs

!!! info

    The `unattended-upgrades` service maintains dedicated log files in the directory, `/var/log/unattended-upgrades/`.

    - `unattended-upgrades.log` contains the main upgrade activity log.
    - `unattended-upgrades-dpkg.log` contains `dpkg` output during package installation.

1.  View the recent log activity:

    ``` bash linenums="1"
    sudo cat /var/log/unattended-upgrades/unattended-upgrades.log
    ```

2.  Here is an example log output showing a successful automatic upgrade run:

    ``` text { .mono-title title="unattended-upgrades.log" linenums="1" }
    2026-05-19 06:25:15,546 INFO Starting unattended upgrades script
    2026-05-19 06:25:15,547 INFO Allowed origins are: origin=Debian,codename=trixie,label=Debian, origin=Debian,codename=trixie,label=Debian-Security, origin=Debian,codename=trixie-security,label=Debian-Security
    2026-05-19 06:25:15,547 INFO Initial blacklist: 
    2026-05-19 06:25:15,548 INFO Initial whitelist (not strict): 
    2026-05-19 06:25:25,138 WARNING Package initramfs-tools-core has conffile prompt and needs to be upgraded manually
    2026-05-19 06:25:27,990 INFO package initramfs-tools not upgraded
    2026-05-19 06:25:29,224 INFO package initramfs-tools-core not upgraded
    2026-05-19 06:25:30,419 INFO No packages found that can be upgraded unattended and no pending auto-removals
    2026-05-19 06:25:30,566 INFO Package initramfs-tools is kept back because a related package is kept back or due to local apt_preferences(5).
    2026-05-19 06:25:30,570 INFO Package initramfs-tools-core is blacklisted.
    ```

3.  See only the last 50 lines of the log:

    ``` bash linenums="1"
    sudo tail -n 50 /var/log/unattended-upgrades/unattended-upgrades.log
    ```

4.  Search for entries from a specific date:

    ``` bash linenums="1"
    sudo grep "2026-05-14" /var/log/unattended-upgrades/unattended-upgrades.log
    ```

5.  Search the log for a specific package:

    ``` bash linenums="1"
    sudo grep "nano" /var/log/unattended-upgrades/unattended-upgrades.log
    ```

### View Logs with Journalctl

1.  If you have `syslog` enabled in the configuration file, you can view the logs with `journalctl`:

    ``` bash linenums="1"
    journalctl -u unattended-upgrades
    ```

2.  View **only** logs from today:

    ``` bash linenums="1"
    journalctl -u unattended-upgrades --since today
    ```

## :symbols-wrench:&ensp;Troubleshoot Issues

### Upgrades Not Running Automatically

1.  Confirm the systemd timer is enabled:

    ``` bash linenums="1"
    systemctl status apt-daily-upgrade.timer
    ```

2.  If the systemd timer is disabled, enable it:

    ``` bash linenums="1"
    sudo systemctl enable apt-daily-upgrade.timer
    sudo systemctl start apt-daily-upgrade.timer
    ```

### Some Packages are Held Back

1.  If your log is showing packages are held back, check for conflicting dependencies:

    ``` bash linenums="1"
    sudo apt update
    sudo apt --simulate upgrade
    ```

2.  Resolve conflicting dependencies by running a full-upgrade manually:

    ``` bash linenums="1"
    sudo apt upgrade
    ```

### Dpkg Lock Error

If `unattended-upgrades` reports lock file errors, this means another package manager process is running.

1.  Check for running `apt` processes:

    ``` bash linenums="1"
    ps aux | grep -E 'apt|dpkg'
    ```

2.  If the `apt` lock is stale, run the following commands:

    ``` bash linenums="1"
    sudo rm /var/lib/apt/lists/lock
    sudo rm /var/lib/dpkg/lock-frontend
    sudo dpkg --configure -a
    ```

### Check for Configuration Errors

Syntax errors in the configuration file will cause `unattended-upgrades` to fail silently. You can check for errors by doing a 'dry-run' and looking for Python tracebacks or error messages.

1.  Run the following command to check for errors:

    ``` bash linenums="1"
    sudo unattended-upgrades --dry-run --debug 2>&1 | head -20
    ```

## :symbols-eraser:&ensp;Remove Unattended-Upgrades

1.  To remove `unattended-upgrades` and optional packages installed previously, run the following command:

    ``` bash linenums="1"
    sudo apt remove unattended-upgrades apt-config-auto-update powermgmt-base
    ```

2.  Run the following command to remove orphaned dependencies:

    ``` bash linenums="1"
    sudo apt autoremove
    ```

3.  Run the following command to verify the package is removed:
    + _No output confirms the package is no longer installed._

        ``` bash linenums="1"
        dpkg -l | grep unattended-upgrades
        ```

4.  After removing the packages the configuration files will remain. Manually delete the configuration files with the following command:

    ``` bash linenums="1"
    sudo rm /etc/apt/apt.conf.d/50unattended-upgrades /etc/apt/apt.conf.d/50unattended-upgrades.bak 2>/dev/null
    ```