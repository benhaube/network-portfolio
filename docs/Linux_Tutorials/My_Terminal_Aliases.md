---
icon: material/console
title: My Terminal Aliases
hide:
  - toc
---
![material/console icon](../assets/icons/console.svg){ width=200 }

# My Terminal Aliases

> [!info]
> Here I have assembled a list of aliases that I find useful and include on all of my GNU / Linux PCs and servers. See the guide, **Defining Terminal Aliases**, for instructions on how to use these aliases on your own distribution.
> 
> :   [Defining Terminal Aliases :material-console:](Defining_Terminal_Aliases.md){ .md-button }

---

```bash title="~/.bashrc.d/aliases" linenums="1"
# --- Universal Shortcuts ---
alias c='clear'
alias s='sudo'

# --- Start calculator with math support ---
alias bc='bc -l'

# --- Generate SHA1 digest ---
alias sha1='openssl sha1'

# --- Create parent directories on demand ---
alias mkdir='mkdir -pv'

# --- Colorize diff output ---
alias diff='colordiff'

# --- Make mount command output human readable ---
alias mount='mount | column -t'

# --- Ping ---
# Stop after 5
alias ping='ping -c 5'
# Go fast
alias fastping='ping -c 100 -s.2'

# --- Show open ports ---
alias ports='netstat -tulanp'

# --- Fix typos ---
alias cd..='cd ..'
alias pdw='pwd'

# --- Colorize the grep command output for ease of use ---
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# --- dnf shortcuts ---
alias uninstall='sudo dnf remove'
alias install='sudo dnf install'
alias update='sudo dnf update'
alias distrosync='sudo dnf distro-sync'
alias autoremove='sudo dnf autoremove'
alias offupdate='sudo dnf upgrade --offline'
alias offreboot='sudo dnf offline reboot'

# --- apt shortcuts ---
alias uninstall='sudo apt remove'
alias install='sudo apt install'
alias update='sudo apt update && sudo apt upgrade'
alias autoremove='sudo apt autoremove'

# --- cd shortcuts ---
alias dl='cd ~/Downloads'
alias doc='cd ~/Documents'
alias pic='cd ~/Pictures'
alias vid='cd ~/Videos'
alias cd-gh='cd ~/Github'
alias cd-sh='cd ~/shell-scripts'
alias ..='cd ..'
alias ~='cd ~'

# --- File management shortcuts ---
alias cp='cp -r'
alias rm='rm -r'
alias v='vim'
alias utar='tar -xvf'

# --- ls shortcuts ---
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -la'
alias l='ls -CF'

# --- git shortcuts ---
alias ga='git add'
alias gp='git push'
alias gcm='git commit'

# --- Print working directory and copy it to the clipboard ---
alias pwdcp='pwd && pwd | xclip -sel clipboard'
```

---