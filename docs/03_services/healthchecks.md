---
icon: services/healthchecks
title: Healthchecks
subtitle: Task Monitoring
description: Open-source cron job and background task monitoring service, written in Python & Django.
status: new
tags:
  - Active
  - Container
  - Monitor
  - New
  - Service
hide:
  - toc
---

![Healthchecks.io logo](../assets/icons/healthchecks-light.svg#only-light){ width=200 }
![Healthchecks.io logo](../assets/icons/healthchecks-dark.svg#only-dark){ width=200 }

# Healthchecks

_Task Monitoring_

[GitHub&ensp;:brands-github:](https://github.com/healthchecks/healthchecks){ .md-button .md-button--primary }&emsp;[Documentation&ensp;:symbols-files:](http://debian-vm.internal:8000/docs/){ .md-button .md-button--primary }

---

![Screenshot of Healthchecks "Projects" page](../assets/screenshots/healthchecks-projects-light.png#only-light){ width=400 align=right .on-glb }
![Screenshot of Healthchecks "Projects" page](../assets/screenshots/healthchecks-projects-dark.png#only-dark){ width=400 align=right .on-glb }

## :symbols-info:&ensp;Overview

#### :symbols-file-text:&ensp;Description

: Healthchecks is a cron job monitoring service. It listens for HTTP requests and email messages _("pings")_ from your cron jobs and scheduled tasks _("checks")_. When a ping does not arrive on time, Healthchecks sends out alerts.

#### :symbols-hash:&ensp;Port(s)

- `2525` &mdash; _SMTP Server_
{ .no-bullets }
- `5432` &mdash; _Postgres DB_
{ .no-bullets }
- `8000` &mdash; _Web Server_
{ .no-bullets }

#### :symbols-link-2:&ensp;URL / Access

:    <http://debian-vm.internal:8000>

#### :symbols-user-key:&ensp;Credentials 

:    [:services-bitwarden:&ensp;Bitwarden](https://vault.bitwarden.com "Bitwarden Web Vault"){ external-link }

    - Local Network&ensp;:symbols-move-right:&ensp;"Healthchecks Admin"
    - Local Network&ensp;:symbols-move-right:&ensp;"Healthchecks User"

## :symbols-package-search:&ensp;Deployment Details

| Host Device                                                            | Method                                    | Container Name       | Image                              | Port(s)       |
| :--------------------------------------------------------------------- | :---------------------------------------- | :------------------- | :--------------------------------- | :------------ |
| [:symbols-layers:&nbsp;Debian Server](../02_hardware/debian_server.md) | :symbols-container:&nbsp;Docker Container | `healthchecks-web-1` | `healthchecks/healthchecks:latest` | `8000` `2525` |
|                                                                        | :symbols-container:&nbsp;Docker Container | `healthchecks-db-1`  | `postgres:16`                      | `5432`        |

### :symbols-settings:&ensp;Configuration

--8<-- "includes/managed_by_dockge.md"

#### :symbols-container:&ensp;Container Deployment

1.  Move the files `compose.yaml` and `.env` to the `/opt/stacks/healthchecks` directory.
2.  Start the container with the following command:

    ``` bash
    docker compose up -d
    ```

3.  If starting fresh, use the following command to create a superuser account for the Healthchecks server:

    ``` bash
    docker compose run web /opt/healthchecks/manage.py createsuperuser
    ```

    This will trigger an interactive prompt.

    You can also provide credentials via parameters, bypassing the interactive prompt:

    ``` bash
    docker compose run web /opt/healthchecks/manage.py createsuperuser --email user@example.com --password changeme123
    ```

``` yaml { .mono-title title="/opt/stacks/healthchecks/compose.yaml" } 
--8<-- "healthchecks-compose.yml"
```

``` properties { .mono-title title="/opt/stacks/healthchecks/.env" }
--8<-- "healthchecks.env"
```

#### :symbols-mail:&ensp;SMTP Listener Config

##### `SMTPD_PORT`

Healthchecks comes with a `smtpd` management command, which runs a SMTP listener service. With the command running, you can ping your checks by sending email messages to `your-uuid-here@hc.example.org` email addresses.

The container is configured to start the SMTP listener conditionally, based on the value of the `SMTPD_PORT` environment value:

- If `SMTPD_PORT` environment variable is not set, the SMTP listener will not run.
- If `SMTPD_PORT` is set, the listener will run and listen on the specified port. You may also need to edit `docker-compose.yml` to expose the listening port (see the "ports" section under the "web" service in `docker-compose.yml`).

##### `PING_EMAIL_DOMAIN`

The container uses the `PING_EMAIL_DOMAIN` environment variable to define the domain to use for generating ping email addresses.

-   Example:

    ``` properties
    PING_EMAIL_DOMAIN=hc.example.org
    ```

    In this example, Healthchecks would generate ping email addresses similar to `3f1a7317-8e96-437c-a17d-b0d550b51e86@hc.example.org`.

This setting only controls how the ping email addresses are constructed, and does not by itself enable the ping-by-sending-email functionality. To receive emails, you will also need:

- A DNS record pointing `hc.example.org` to your Healthchecks instance's IP address.
- `manage.py smtpd` _(Healthchecks' SMTP listener service)_ running, listening on port 25, and reachable from the outside world.

#### :symbols-message-square-dot:&ensp;Notification Integrations

##### Email

To send email notifications, the container needs to be configured with your SMTP provider using environment variables in the `.env` file.

``` properties title="Example" linenums="13" 
--8<-- "healthchecks.env:13:19"
```

1.  To add an email integration, go to the **Integrations** tab, click **Add** next to email, and enter the address where you want email notifications sent.

    ![Healthchecks add email integration](../assets/screenshots/healthchecks-email-integration-light.png#only-light){ width=600 }
    ![Healthchecks add email integration](../assets/screenshots/healthchecks-email-integration-dark.png#only-dark){ width=600 }

2.  Click **Save Integration** to return to the Integrations tab, and click **Test** on your new integration to send a test notification. If your SMTP server is configured correctly, you will recieve a message in your email inbox. If you do not see a test notification, check your spam / junk folder and your SMTP configuration.

    ![Healthchecks test integration](../assets/screenshots/healthchecks-test-integration-light.png#only-light){ width=600 }
    ![Healthchecks test integration](../assets/screenshots/healthchecks-test-integration-dark.png#only-dark){ width=600 }

##### Gotify

[Gotify](gotify.md) is an open-source, self-hosted push notification service. If you use or plan on using Gotify, you can can integrate it with your Healtchecks account in few simple steps.

1.  Log into your [Gotify instance](https://gotify.rac3r4life.online), go to **Apps**, and create a new application. Pick a descriptive name and short description. After creating the app, you can also upload an icon for it.
2.  After you have created the application, copy its **application token**.
3.  Enter the URL of your **Gotify** server, and the **application token** in the form shown below. Then save the integration, and you are done!

    ![Healthchecks add Gotify integration](../assets/screenshots/healthchecks-gotify-integration-light.png#only-light){ width=600 }
    ![Healthchecks add Gotify integration](../assets/screenshots/healthchecks-gotify-integration-dark.png#only-dark){ width=600 }

4.  After returning to the **Integrations** tab, you can test the new integration using the same method shown above for the email integration.

##### Home Assistant

To enable **Home Assistant** notifications, first you need to make sure the **Apprise** integration is enabled using the `APPRISE_ENABLED` environment variable.

``` properties title="Example"
APPRISE_ENABLED=True
```

1.  To add a Home Assistant integration, go to the **Integrations** tab, click **Add** next to Apprise, and enter the Webhook URL for your Home Assistant server.

    ![Healthchecks add Apprise integration](../assets/screenshots/healthchecks-apprise-integration-light.png#only-light){ width=600 }
    ![Healthchecks add Apprise integration](../assets/screenshots/healthchecks-apprise-integration-dark.png#only-dark){ width=600 }

    !!! tip

        The Home Assistant Webhook URL can use the following formats:

        ``` text
        hassio://{host}/{access_token}
        hassios://{host}/{access_token}
        hassio://{host}:{port}/{access_token}
        ```

        The **Apprise** integration is capable of sending notifications to any service that is compatible with Apprise.

2.  Click **Save Integration** to return to the Integrations tab, and click **Test** on your new integration to send a test notification to your Home Assistant server.
