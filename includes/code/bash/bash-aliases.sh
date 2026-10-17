# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# This file defines custom aliases #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# ~~~ Shortcuts ~~~
alias c='clear'
alias s='sudo'

# ~~~ `bc` with math support ~~~
alias bc='bc -l'

# ~~~ Generate SHA1 ~~~
alias sha1='openssl sha1'

# ~~~ Create parent directories ~~~
alias mkdir='mkdir -pv'

# ~~~ Colorize `diff` ~~~
alias diff='colordiff'

# ~~~ Human-readable `mount` command ~~~
alias mount='mount | column -t'

# ~~~ Show open ports ~~~
alias ports='netstat -tulanp'

# ~~~ `ping` shortcuts ~~~
alias ping5='ping -c 5'
alias fastping='ping -c 100 -s 2'

# ~~~ Fix typos ~~~
alias cd..='cd ..'
alias pdw='pwd'

# ~~~ Colorize `grep` ~~~
export GREP_OPTIONS='--color=auto'
alias grep='grep $GREP_OPTIONS'
alias egrep='egrep $GREP_OPTIONS'
alias fgrep='fgrep $GREP_OPTIONS'

# ~~~ `dnf` shortcuts ~~~  (1)
# alias remove='sudo dnf remove'
# alias install='sudo dnf install'
# alias update='sudo dnf upgrade --offline --refresh && sudo dnf offline reboot'
# alias distrosync='sudo dnf distro-sync'
# alias autoremove='sudo dnf autoremove'

# ~~~ `apt`` shortcuts ~~~  (2)
# alias remove='sudo apt remove'
# alias install='sudo apt install'
# alias update='sudo apt update && sudo apt upgrade'
# alias autoremove='sudo apt autoremove'

# ~~~ `cd` shortcuts ~~~
alias ..='cd ..'
alias ~='cd ~'

# ~~~ File management ~~~
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias utar='tar -xvf'

# ~~~ `ls` shortcuts ~~~
export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
alias ll='ls $LS_OPTIONS -l'
alias la='ls $LS_OPTIONS -A'
alias lla='ls $LS_OPTIONS -la'
alias l='ls $LS_OPTIONS -CF'

# ~~~ `git` shortcuts ~~~
alias ga='git add'
alias gp='git push'
alias gcm='git commit'

# ~~~ Format the `$PATH` output ~~~
alias showpath='echo $PATH | tr ":" "\n"'

# ~~~ Print working directory and copy it to the clipboard ~~~
# alias pwdcp='pwd && pwd | xclip -sel clipboard'  (3)
# alias pwdcp='pwd && pwd | wl-copy'  (4)