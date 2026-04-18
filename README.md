![Project Logo](.readme-assets/project-icon.png) ![Screenshot of Index page](.readme-assets/index_screenshot_readme.png)

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

> [!tip]
> The `roamlinks` plugin is very important for this project to ensure all of the internal links function properly. The Markdown files originated from my Obsidian vault. While they have been heavily modified, there are still some links in the Wikilink format. MkDocs / Pymdownx cannot natively handle Wikilinks, so the `roamlinks` plugin is crucial for interpreting these remaining links. 

**Pull Material for MkDocs:**

```bash
podman pull docker.io/squidfunk/mkdocs-material:latest
```

**Build Image w/ Extra Plugins:**

```bash
podman build -t mkdocs-custom
```

### Building / Serving the Site

> [!note]
> There are two compose files included in the repo. The `compose-serve.yml` file will spin up the `mkdocs-custom` container and serve the site to http://localhost:8000. It is not recommended to serve the site in this way. It is for testing only. When you are ready to publish your changes you build the site and host it on a separate Web server. I recommend using Nginx.

**Serve Site for Testing:**

```bash
podman compose -f compose-serve.yml up -d  # You can optionally remove the detach flag `-d` if you want to see the log output for debugging. 
```

**Build Site for Deployment:**

```bash
podman compose -f compose-build.yml up -d
```

> [!tip]
> Move the resulting `site/` directory onto the Web server of your choice.

### 🙏 Special Thanks

I would like to give special thanks to the following projects whose work was used extensively in this project:

+ **Google:**
    + For their `Google Sans Flex` and `Google Sans Code` fonts
    + For their icons in the `Material Symbols Font` and `Material Design Icons` collections.
+ **Material for MkDocs:**
    + For their incredible static website generator.
+ **Simple Icons:**
    + For their amazing brand icons.
+ **Selfh.st:**
    + For their awesome, colorful brand icons. 
+ **Mermaid.js:**
    + For building an amazing tool for rendering beautiful flowcharts. 