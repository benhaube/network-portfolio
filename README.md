<p align="center">
    <a href="https://portfolio.rac3r4life.online">
        <img src="./readme-assets/project-icon.png" alt="Project / Site Logo">
    </a>
</p>
<p align="center">
    <a href="https://github.com/benhaube/network-portfolio/blob/main/LICENSE.txt">
        <img alt="Static Badge" src="https://img.shields.io/badge/License-GFDL_v1.3-%234CAE4F?link=https%3A%2F%2Fgithub.com%2Fbenhaube%2Fnetwork-portfolio%2Fblob%2Fmain%2FLICENSE.txt">
    </a>
    <a href="https://github.com/squidfunk/mkdocs-material">
        <img alt="Static Badge" src="https://img.shields.io/badge/Material_for_MkDocs-repo-%23526CFE?logo=materialformkdocs&logoColor=%23526CFE&link=https%3A%2F%2Fgithub.com%2Fsquidfunk%2Fmkdocs-material">
    </a>
    <a href="https://github.com/lucide-icons/lucide">
        <img alt="Static Badge" src="https://img.shields.io/badge/Lucide%20Icons-repo-%23F56565?logo=lucide&logoColor=%23F56565&link=https%3A%2F%2Fgithub.com%2Flucide-icons%2Flucide">
    </a>
    <a href="https://fonts.google.com/icons">
        <img alt="Static Badge" src="https://img.shields.io/badge/Google_Fonts-Icons-%234285F4?logo=googlefonts&logoColor=%234285F4&link=https%3A%2F%2Ffonts.google.com%2Ficons">
    </a>
</p>
<p align="center">
    <a href="#clone-the-repo">Clone the Repository</a>
    ·
    <a href="#using-docker">Build Using Docker</a>
    ·
    <a href="#using-python">Build Using Python</a>
</p>

# Network Documentation & Portfolio 

This is my personal, self-hosted professional portfolio and network documentation website built with [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/). This repository only contains the source markdown and development files. The built website in the `/site` directory is not tracked in the repo, but get's uploaded to my Nginx Web server. The website is hosted on my own server and exposed to the internet with a Cloudflare Tunnel. 

![Screenshot of Index page](./readme-assets/index-screenshot.png)

![Screenshot of header bar](./readme-assets/header-screenshot.png)

> [!note] 
> **Update: 2026/06/24**
> 
> The **comprehensive visual overhaul** of the site is now complete! I have updated and modernized the visual appearance of the site with custom CSS and new, rounded Material icons. The goal was to emulate the modern look of the new Zensical static site generation tool which is the successor to Material for MkDocs. Unfortunately, after doing some testing with Zensical I determined that it is not currently feasible to migrate this project. It is still missing some features I rely on for this site *(e.g., the blog and panzoom plugins)*.  I figured while I wait for Zensical to develop I could modernize the visual appearance of my MkDocs site by replicating the design as closely as possible.

## Clone the Repo

#### HTTPS

```bash
git clone https://github.com/benhaube/network-portfolio.git

cd network-portfolio/
```

#### SSH

```bash
git clone git@github.com:benhaube/network-portfolio.git

cd network-portfolio/
```
## Using Docker

### Build the Custom Image

> [!note] 
> This project uses plugins for MkDocs that are not included with the standard Docker image. Therefore it is a requirement to pull the standard image and build a new, custom image with those plugins added. The `Dockerfile` contains the 'instructions' for **Docker / Podman** to build the custom image. The two `compose-*.yml` files already have the `localhost/mkdocs-custom` image defined. 

#### Pull Material for MkDocs

```bash
podman pull docker.io/squidfunk/mkdocs-material:latest
```

#### Build Image w/ Extra Plugins

```bash
podman build -t mkdocs-custom .
```

### Building / Serving the Site

> [!note]
> There are two compose files included in the repo. The `compose-serve.yml` file will spin up the `mkdocs-custom` container and serve the site to `http://localhost:8000`. It is not recommended to serve the production site in this way. It is for testing only. When you are ready to publish your changes you build the site and host it on a separate Web server. I recommend using [Nginx](https://github.com/nginx/nginx).

#### Serve Site for Testing

```bash
podman compose -f compose-serve.yml up -d  # You can optionally remove the detach flag `-d` if you want to see the log output for debugging. 
```

#### Build Site for Deployment

```bash
podman compose -f compose-build.yml up -d
```

> [!tip]
> **Material for MkDocs** will create a new directory in the root of the repository named 'site' and build the site in that directory. Move the resulting `site/*` directory and its contents onto the Web server of your choice. Do **NOT** move any other source files or directories to the Web server. 

#### Alternative `podman run` commands

Podman / Docker compose is the preferred method for starting and stopping the MkDocs container, but you can also use the following `podman run` commands. 

```bash
podman run --rm -it -p 8000:8000 -v ${PWD}:/docs:Z mkdocs-custom serve -a 0.0.0.0:8000 --livereload
```

```bash
podman run --rm -it -v ${PWD}:/docs:Z mkdocs-custom build
```

> [!note]
> The `:Z` or `:z` in the volume definition *(also in the compose.yml files)* is critical for **Fedora / Podman** based workstations that use SE-Linux. The container will not run properly without it. It allows the container to set the appropriate SE-Linux context on each file in the repo directory. 

## Using Python

### Setup Python Virtual Environment

```bash
python -m venv venv/
source venv/bin/activate
```

#### Install Material for MkDocs

```bash
pip install mkdocs-material "mkdocs-material[imaging]"
```

#### Install Plugins

```bash
pip install mkdocs-awesome-nav mkdocs-glightbox mkdocs-panzoom-plugin mkdocs-open-in-new-tab
```

### Building / Serving the Site

#### Serve Site for Testing

```bash
mkdocs serve -a 0.0.0.0:8000 --livereload
```

#### Build Site for Deployment

```bash
mkdocs build
```

> [!tip]
> **Material for MkDocs** will create a new directory in the root of the repository named 'site' and build the site in that directory. Move the resulting `site/*` directory and its contents onto the Web server of your choice. Do **NOT** move any other source files or directories to the Web server. 

## 🙏 Special Thanks

I would like to give special thanks to the following projects whose work was used extensively in this project:

+ **[Google](https://fonts.google.com/):**
    + For their `Google Sans` and `Google Sans Code` fonts
    + For their beautiful rounded icons in the `Material Symbols` collection.
+ **[Material for MkDocs](https://squidfunk.github.io/mkdocs-material/):**
    + For their incredible open-source static website generator.
+ **[Lucide](https://lucide.dev/):**
    + For their beautiful and modern icon library.
+ **[Simple Icons](https://simpleicons.org/):**
    + For their amazing brand icons.
+ **[Selfh.st](https://selfh.st/icons/):**
    + For their awesome, colorful brand icons. 
+ **[Mermaid.js](https://mermaid.js.org/):**
    + For building an amazing tool for rendering beautiful flowcharts.
+ **[VSCodium](https://vscodium.com/):**
    + For their excellent open-source, MIT-Licensed Integrated Developer Environment that lacks Microsoft's spyware / telemetry. I have used it extensively in the development of this website, and daily in all of my projects and network configuration management.
