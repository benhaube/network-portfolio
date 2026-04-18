![Project Logo](docs/assets/icons/readme.png)

# Network Documentation & Portfolio 
*Built with Material for MkDocs*

This is my personal, self-hosted professional portfolio and network documentation website built with [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/). This repository only contains the source markdown and development files. The built website in the `/site` directory is not tracked in the repo, but get's uploaded to my Nginx Web server. The website is hosted on my own server and exposed to the internet with a Cloudflare Tunnel. 

## Building the Site

### Clone the Repo

**HTTPS:**

```bash
git clone https://github.com/benhaube/network-portfolio.git

cd network-portfolio/
```

**SSH:**

```bash
git clone git@github.com:benhaube/network-portfolio.git

cd network-portfolio/
```

### Build the Custom Image

> [!note] 
> This project uses plugins for MkDocs that are not included with the standard Docker image. Therefore it is a requirement to pull the standard image and build a new, custom image with those plugins added. The `Dockerfile` contains the 'instructions' for **Docker / Podman** to build the custom image. The two `compose-*.yml` files already have the `localhost/mkdocs-custom` image defined. 

**Pull Material for MkDocs:**

```bash
podman pull docker.io/squidfunk/mkdocs-material:latest
```

**Build Image w/ Extra Plugins:**

```bash
podman build -t mkdocs-custom
```

#### Building / Serving the Site

> [!note]
> There are two compose files included in the repo. The `compose-serve.yml` file will spin up the `mkdocs-custom` container and serve the site to http://localhost:8000. It is not recommended to serve the site in this way. It is for testing only. When you are ready to publish your changes you build the site and host it on a separate Web server. I recommend using Nginx.