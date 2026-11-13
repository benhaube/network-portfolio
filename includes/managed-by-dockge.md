??? dockge "Managed by Dockge"

    This container stack is deployed with and managed by [Dockge](dockge.md). To pull updated images, start / stop the containers, modify the environment variables, and modify the `compose.yaml` file; visit the [Dockge Web-UI](http://pi-server.internal:5001){ external-link }. 
    
    Alternatively, start an SSH session with the host server to edit the `compose.yaml` and `.env` files directly with a text editor _(e.g., `nano`)_, then use the `docker compose` command to manage the container stack.