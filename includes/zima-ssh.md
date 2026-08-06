!!! zima "Don't Forget!"

    **ZimaOS** does not have SSH enabled after a fresh install. For the [ZimaOS NAS](../02_hardware/zimaos_nas.md#role){ data-preview } the SSH service needs to be enabled first through the [ZimaOS Web UI](http://storage-server.internal/){ external-link } in the developer options.

    -   Settings&ensp;:symbols-move-right:&ensp;General&ensp;:symbols-move-right:&ensp;Developer Mode&ensp;:symbols-move-right:&ensp;SSH Access

        ![ZimaOS developer settings screenshot](../assets/screenshots/zimaos_ssh_light.png#only-light){ width=600 }
        ![ZimaOS developer settings screenshot](../assets/screenshots/zimaos_ssh_dark.png#only-dark){ width=600 }

    -   After enabling SSH in the developer options the [ttydBridge](../03_services/ttydbridge.md#description){ data-preview } application is automatically installed. The SSH service can be configured from there.
    -   Once the SSH server is configured the **ttydBridge** application is no longer needed, but remains installed. This is a good backup to get shell access in case of an SSH configuration issue.