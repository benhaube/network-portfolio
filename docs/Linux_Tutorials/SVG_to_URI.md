---
icon: material/svg
title: Converting an SVG into Data URI
hide:
  - toc
---
![Material Design SVG icon customized](../assets/icons/svg.svg){ width=225 }

# Converting an SVG into Data URI

> [!question]+ FAQ
> **What is an SVG?**
> 
> :   An SVG file is an XML-based vector graphics format for defining two-dimensional graphics. SVG icons are great because they can be resized without losing any quality since, unlike a standard image, they are just a plain text file instructing the computer how to draw the desired graphic on the screen. This also means their file size is tiny making them great for web applications. Using an SVG in place of a JPG / JPEG or PNG will speed up your page loading times and save bandwidth. 
>
> **Why convert it into a data URI?**
> 
> :   Sometimes it might be useful to convert an SVG into a data URI for use in a CSS stylesheet instead of inserting the SVG directly into the HTML. This tutorial will show you how to convert an SVG into a data URI in your Linux CLI, and how to create a custom function, `svg2uri`, so you do not need to manually type the long command every time. 

---

## :material-check-decagram: Prerequisites

To complte this tutorial you will need the following packages:

+ `nodejs` *(Javascript runtime)*
+ `wl-copy` *(On Wayland-based systems)*
+ `xclip` *(On Xorg-based systems)*

## :material-console: The Command

You can simply use the command below if you only need to do one icon, but if you have several icons *(or just want to have an easy way to do it in the future)* you can follow the instructions to define a function.

```bash {linenums="1" .wrap-code}
cat <your-icon>.svg | node -e "const fs = require('fs'); console.log('data:image/svg+xml;charset=utf-8,' + encodeURIComponent(fs.readFileSync(0, 'utf-8')))"
```

### Changing the Color / Size

+ You can change the color by adding a `fill` attribute to either the main `<svg>` tag or the specific `<path>` tag. 
    + You can use standard hex codes, RGB values, or CSS color names.
+ To scale the icon up or down, leave the `viewBox` alone and explicitly define the `width` and `height` attributes.
    + Material Design icons, for example, typically use a `viewBox="0 0 24 24"`.

#### The CLI Power-User Route:

If you want to handle the color and size adjustments without even opening a text editor, you can use `sed` to inject those attributes on the fly and pipe the output directly into the Node.js encoder.

+ Here is a one-liner that injects a green hex code and a `48x48` size into your standard `<your-icon>.svg` and outputs the final data URI:

    ```bash {linenums="1" .wrap-code}
    cat <your-icon>.svg | sed 's/<svg/<svg fill="%2310B981" width="48" height="48"/g' | node -e "const fs = require('fs'); console.log('data:image/svg+xml;charset=utf-8,' + encodeURIComponent(fs.readFileSync(0, 'utf-8')))"
    ```

    > [!note]+
    > `fs.readFileSync(0, 'utf-8')` tells Node.js to read directly from the standard input rather than a saved file.

## :material-file-code-outline: Making a Function

This is the perfect use case for a shell alias / function. On Linux we can easily add this to the Bash shell's configuration file (`.bashrc`) so it is always available. Here is how to create a custom `svg2uri` function that reads directly from standard input.

#### Add the function to your shell profile:

> [!tip inline end]
> If you have a lot of different aliases / functions it can be beneficial to add them into your distribution's dedicated file to keep your `.bashrc` file cleaner. 
> 
> You can check out instructions on how to do this for **Debian / Fedora** based distributions in my tutorial: 
>
> [Defining Aliases :material-console:](Defining_Terminal_Aliases.md){ .md-button }

1. Open your terminal profile configuration *(usually `~/.bashrc` if you are using Bash, or `~/.zshrc` if you are using Zsh)* in your preferred editor:

    ```bash linenums="1"
    nano ~/.bashrc
    ```

2. Scroll to the bottom of the file and paste this block:

    ```bash linenums="1"
    svg2uri() {
      # (1)!
      node -e "const fs = require('fs'); console.log('data:image/svg+xml;charset=utf-8,' + encodeURIComponent(fs.readFileSync(0, 'utf-8').trim()))"
    }
    ```

    1. Reads from standard input (stdin) and outputs a URL-encoded SVG Data URI

    > [!note]+
    > I appended a `.trim()` to the end of the command just to ensure no invisible newline characters at the end of the file get encoded.

3. Save and close the `~/.bashrc` file: 

    ++ctrl+o++ to save the file 
    
    ++ctrl+x++ to close the file

4. Reload the connfiguration:

    ```bash linenums="1"
    source ~/.bashrc
    ```

#### Using the Function:

Now you can pipe any SVG directly into your new command. 

+ If you just want the raw conversion:

    ```bash linenums="1"
    cat <your-icon>.svg | svg2uri
    ```

+ Or, if you want to use the `sed` trick I mentioned above to inject a color or change size before it gets encoded, you can just chain them together:

    ```bash linenums="1"
    cat <your-icon>.svg | sed 's/<svg/<svg fill="%2310B981" width="48" height="48"/g' | svg2uri
    ```

#### Bonus: Send it straight to your clipboard

If you want to skip highlighting and copying the terminal output altogether, you can pipe the final output directly to your system's clipboard. On Linux you have either `xclip` *(X11)* or `wl-copy` *(Wayland)* available: 

```bash linenums="1"
cat icon.svg | svg2uri | wl-copy  # (1)! 
cat icon.svg | svg2uri | xclip -selection clipboard  # (2)!
```

1. For Wayland *(The default on most modern Linux distributions)*
2. For X11 *(A legacy display server used mostly on older Linux installs)*

Now you can just ++ctrl+v++ the output into whatever CSS / HTML file you are working on. 

## :material-wrench: Using the Output

Once you have your generated string, you can drop it directly into your code:

```html title="HTML Example" linenums="1" 
<img src="data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D..." alt="My Icon" />
```

```css title="CSS Example" linenums="1"
.my-icon {
  background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D...");
}
```