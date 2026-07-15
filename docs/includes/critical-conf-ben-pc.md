!!! config "Critical Configurations"

    **:symbols-clock-refresh-cw:&ensp;Chrony:**

    + Time synchronizes with local time server running on main router, [ASUS RT-BE92U](ASUS_RT-BE92U.md), using `chrony`.
    + See the ["Clients"](../03_services/chrony.md#clients) section of the Chrony service documentation page for configuration information. 

    **:symbols-lock-keyhole-open:&ensp;LUKS Unlocking:**

    + The LUKS encrypted boot drive is configured to use the onboard `TPM2` chip for drive encryption. Kernel and firmware upgrades require clearing the registered PCRs and enrolling the new ones. This can be done with a custom script I wrote, `update-pcrs`, which is located in the `/usr/local/bin` directory.
    + The proper command format is:
 
        ```bash linenums="1"
        sudo update-pcrs /dev/nvme0n1p3
        ```

    + More information about the configuration process can be found at: [Unlocking LUKS Volumes with TPM2](../linux_tutorials/unlock_luks_tpm2.md) 