### :symbols-ethernet-port-power:&ensp;Configure Wake on LAN

This network utilizes the "magic packet" with WoL to power on clients and servers by sending a packet to the network interface. WoL is not enabled by default, so it is necessary to configure it manually on the systems you wish to have this capability. To enable WoL persistently using `nmcli`, you must modify the connection profile rather than the interface directly. Unlike `ethtool` _(which changes the setting only for the current session)_, `nmcli` saves the configuration to the connection profile file on the disk.

1.  Run the following command to find the name of your Ethernet connection. _(Note the NAME not DEVICE)_

    ``` bash
    nmcli connection show
    ```

    ``` shell-session { title="Example Output" hl_lines="2" }
    NAME                UUID                                  TYPE      DEVICE 
    Wired connection 1  89c00fef-db95-3ebb-a2b2-e3dc528750e9  ethernet  enp7s0 
    Home                82ab530f-f9d2-4c55-bd99-e872b43c55af  wifi      wlp6s0 
    lo                  68f3b0b4-c518-42de-9753-a7f90731bad3  loopback  lo     
    ```

2.  Run the following command to enable the "magic packet," replacing "Wired Connection 1" with the actual connection name.

    ``` bash
    sudo nmcli connection modify "Wired connection 1" 802-3-ethernet.wake-on-lan magic
    ```

3.  Reload the connection to apply the configuration immediately.

    ``` bash
    sudo nmcli connection up "Wired connection 1"
    ```

4.  Confirm WoL is enabled with the "magic packet" using the following command, replacing "Wired connection 1" with the actual connection name.

    ``` bash
    nmcli connection show "Wired connection 1" | grep wake-on-lan
    ```

    ``` shell-session { title="Example Output" hl_lines="1" }
    802-3-ethernet.wake-on-lan:             magic
    802-3-ethernet.wake-on-lan-password:    --
    ```

5.  Run the following command to find the hardware MAC address of the network interface, replacing `enp7s0` with the actual device name. _(Shown in the connection list from the previous command)_

    ``` bash
    nmcli device show enp7s0 | grep HWADDR
    ```

    ``` shell-session { title="Example Output" }
    GENERAL.HWADDR:                         3C:7C:3F:0D:A9:CD
    ```

6.  Test the WoL "magic packet" by powering the device off. Then from another device entering the following command, replacing `3C:7C:3F:0D:A9:CD` with the actual MAC address of the network interface.

    ``` bash
    wol 3C:7C:3F:0D:A9:CD
    ```

    _After entering the command the target device should power on._
