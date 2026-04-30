---
icon: material/console
hide:
  - toc
---
![material/console icon](../assets/icons/console.svg){ width=225 }

# Defining Terminal Aliases

> [!question] FAQ
> **What are terminal aliases?**
> 
> :     When operating in a GNU / Linux terminal environment, aliases are an indispensable necessity to speed up your workflow. You can create an alias to eliminate the need to memorize the required arguments, you can combine several commands into an easy shortcut, you can automatically fix common typos, and many more. This guide will show you how to set up useful terminal aliases on both **Fedora / RHEL** and **Debian / Ubuntu** based GNU / Linux distributions. 

[:material-arrow-down-thin:&nbsp;Jump to **Fedora / RHEL** Instructions&nbsp;:material-arrow-down-thin:](#fedora-rhel-based-distributions)

---
## :material-debian: Debian / Ubuntu Based Distributions:

1. Create a backup of your `.bashrc` file contained in your home (`~/`) directory. We want to have a backup of the original file before we make any changes just in case. Any errors in the `~/.bashrc` file could potentially cause the terminal to fail to initialize. 

    + Open a terminal window and execute the following command:

        ```bash linenums="1"
        cp ~/.bashrc ~/.bashrc.bkp 
        ```

2. Check your `~/.bashrc` file to make sure it includes the following code:

    ```bash title="~/.bashrc" linenums="1"
    if [ -f ~/.bash_aliases ]; then
        ~/.bash_aliases
    fi
    ```

    + Your **Debian / Ubuntu** based distribution should have this code in the `~/.bashrc` file by default, but in case it doesn't you can open the file in the text editor of your choice *(e.g., nano)* and paste it into the end of the file. 

        ```bash linenums="1"
        nano ~/.bashrc
        ```
        
        + ++ctrl+o++ to save the changes
        + ++ctrl+x++ to exit 

3. Create a new file in your home (`~/`) directory called `.bash_aliases`

    ```bash linenums="1"
    nano ~/.bash_aliases
    ```

    + Write your desired aliases into this file, then ++ctrl+o++ to save the changes and ++ctrl+x++ to exit nano. 

4. Now run the command `#!bash source ~/.bashrc`, or open a new tab in your terminal application of choice. 
    + Test one of the aliases you created to make sure they are loaded properly when a terminal session is started. 
    + If your aliases were not loaded properly, check the code you entered into the `~/.bashrc` file for errors. 

## :material-fedora: Fedora / RHEL Based Distributions:

1. Create a backup of your `.bashrc` file contained in your home *(`~/`)* directory. We want to have a backup of the original file before we make any changes just in case. Any errors in the `~/.bashrc` file could potentially cause the terminal to fail to initialize. 

    + Open a terminal window and execute the following command:

        ```bash linenums="1"
        cp ~/.bashrc ~/.bashrc.bkp
        ```

2. Check your `~/.bashrc` file to make sure it includes the following code:

    ```bash title="~/.bashrc" linenums="1"
    # User specific aliases and functions
    if [ -d ~/.bashrc.d ]; then
        for rc in ~/.bashrc.d/*; do
            if [ -f "$rc" ]; then
                . "$rc"
            fi
    done
    fi
    unset rc
    ```

    + Your **Fedora / RHEL** based distribution should have this code in the `~/.bashrc` file by default, but in case it doesn't you can open the file in the text editor of your choice *(e.g., nano)* and paste it into the end of the file. 

        ```bash linenums="1"
        nano ~/.bashrc
        ```

        + ++ctrl+o++ to save the changes
        + ++ctrl+x++ to exit 

    > [!note]
    > **Fedora / RHEL** based GNU / Linux distributions use a different method for modifying the `~/.bashrc` file which I find more intuitive and modular. Instead of modifying the file directly and creating a dedicated `~/.bash_aliases` file, this code allows you to create a hidden sub-directory within your home (`~/`) directory to house all the modifications in separate files. I find this method to be superior, personally. It allows you to easily enable / disable your modifications, and keeps them far more organized. 
    >
    > You can use this directory to store all future modifications to your `~/.bashrc` file, not just your aliases. For example, in my `~/.bashrc.d` directory I have files to define paths, change my SSH key agent to Bitwarden, enable the [Starship](https://starship.rs) terminal prompt, enable `fzf`, and to print a custom `fastfetch` profile to show relevant system information every time I open a new terminal.

3. Make a new directory `~/.bashrc.d` within your home directory.

    ```bash linenums="1"
    mkdir -p ~/.bashrc.d
    ```

4. Enter the directory and create a new file called 'aliases' to store all of your desired aliases.

    ```bash linenums="1"
    cd ~/.bashrc.d
    nano aliases
    ```

    > [!tip]
    > **#!/bin/bash**
    > :     I prefer to put `#!/bin/bash` on the first line of the file. This is not strictly necessary, but it tells your text editor to use proper syntax highlighting for Bash if it is available. An alternative would be to give the file the `.sh` file extension. However, if you do not care about syntax highlighting in your text editor, then neither are necessary.

5. Paste or type in your desired aliases, then ++ctrl+o++ to save the changes and ++ctrl+x++ to exit nano.

6. Now run the command `#!bash source ~/.bashrc`, or open a new tab in your terminal application of choice. 
    + Test one of the aliases you created to make sure they are loaded properly when a terminal session is started. 
    + If your aliases were not loaded properly, check the code you entered into the `~/.bashrc` file for errors. 

> [!tip]
> **Recommended Aliases:**
> :     You may be asking, "Great, but I have no idea what aliases I may want to use. Do you have any recommendations?" For those of you needing some recommendations, I have a file in this repository that contains a bunch of the aliases that I find useful, and have on my systems.
> 
>       [My Aliases :material-console:](My_Terminal_Aliases.md){ .md-button }