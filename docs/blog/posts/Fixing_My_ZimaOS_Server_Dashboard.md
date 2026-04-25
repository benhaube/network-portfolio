---
icon: material/svg
title: Fixing My ZimaOS Server Dashboard
date: 
  created: 2026-04-25
authors: 
  - benhaube
draft: false
categories:
  - Networking
  - Development
  - Linux
links:
  - Linux_Tutorials/SVG_to_URI.md
pin: false
hide:
  - toc
---
![Material Design svg icon customized](../assets/icons/svg.svg){ width=200 }

If you are like me, an advanced Linux user, using ZimaOS you probably have a LOT of services installed with custom `docker-compose.yml` files instead of using the App Store. When it comes to setting icons for these services to display on the server's dashboard I felt constrained. That is, until I remembered I can easily convert an SVG file into a data URI. I gave it a try and it worked! This is a HUGE benefit because you no longer need to rely on someone else's server somewhere on the Internet to continue hosting your desired icon. It is now entirely contained within a URI. Also, being self-contained means you are sending less outbound requests making it inherently more private. In this post I will describe how I decided to accomplish this, and set up my workflow.

<!-- more -->

An SVG icon is not an actual image with a resolution like the image you take with your camera. It is really just an XML plain-text file that tells the computer how to draw the graphic. This is called a "Vector graphic." They are great because the files are tiny, and they can be resized up or down basically infinitely without losing any quality. They are also great for use on Websites like this one. The small file size helps to speed up page loading times, and saves bandwidth. Vector graphics are truly amazing. I love them so much that I use them extensively on this website, and within services hosted in my homelab. 

There are actually a few different options I had for converting SVG files into a data URI. There are many online tools *(like [this](https://yoksel.github.io/url-encoder/) popular one)*, but that is not really my style. I like to do things locally whenever I possibly can. Minimizing my reliance on Web services and maintaining ownership of my data is very important to me. Next, I could have used Javascript's built-in `encodeURIComponent()` function. This would satisfy my local requirement, but it is overly complicated. I would need to write a script for every, single icon that I want to convert. 

```javascript title="Javascript" linenums="1"
// 1. Your raw SVG string
const rawSVG = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20,19V7H4V19H20M20... "/></svg>`;

// 2. Add the prefix and URL-encode the SVG
const dataUri = 'data:image/svg+xml;charset=utf-8,' + encodeURIComponent(rawSVG);

console.log(dataUri);
```

Finally, I settled on the third option, the "Developer way." You can convert an SVG directly from the Linux terminal using Node.js with a quick, one line command. Granted, it is a pretty complicated command...

```bash {.wrap-code}
cat icon.svg | node -e "const fs = require('fs'); console.log('data:image/svg+xml;charset=utf-8,' + encodeURIComponent(fs.readFileSync('icon.svg', 'utf8')))"
```

This command will output the data URI which I could paste directly into the icon URL field in my ZimaOS dashboard. I could simply type this command every time I want to set or change an icon for a service on the dashboard, but that would become pretty tedius rather quickly. Instead I decided to make a special function. I called my function `svg2uri`. Pretty simple right? It is a LOT faster than typing that super long command every time, and it is easier than having to paste that command from a text document too. 

My Linux PCs run Fedora (KDE Plasma Desktop Edition). Fedora has a rather great standard for modifying your `.bashrc` file. There is a nice block of bash code in their `.bashrc` file that watches for files in a sub-directory in your home folder, and automatically appends the contents of those files to your `.bashrc` file. This directory is called `~/.bashrc.d/`. I have a lot of customizations to my CLI, so in that directory I have a few files for making changes: `aliases`, `env`, and `functions`. I wrote the function into my `~/.bashrc.d/functions` file, and ran the command `source ~/.bashrc` to reload the shell settings. That's it! Now my new function is set up. 

```bash title="svg2uri" linenums="1" 
svg2uri() {
  # Reads from standard input (stdin) and outputs a URL-encoded SVG Data URI
  node -e "const fs = require('fs'); console.log('data:image/svg+xml;charset=utf-8,' + encodeURIComponent(fs.readFileSync(0, 'utf-8').trim()))"
}
```

Now all I need to do to generate a URI from an SVG file is run the command: `#!bash cat icon.svg | svg2uri`. In fact, I made it even easier on myself with the `wl-copy` command. Like most modern Linux distributions, Fedora uses the Wayland display protocol by default, and Wayland comes with a neat tool that automatically adds a command's output to the clipboard. All I need to do is add another pipe to the `wl-copy` command: `#!bash cat icon.svg | svg2uri | wl-copy`. Now all I need to do is ++ctrl+v++ the command output into the service's settings panel on my ZimaOS dashboard. 

If you have a NAS running ZimaOS, or you just want to convert SVG files for easy use in HTML or CSS files you can check out the step-by-step tutorial *(linked in the sidebar)* I have written to set this up for yourself. 

Thanks for reading! If you have any thoughts leave a comment below. 