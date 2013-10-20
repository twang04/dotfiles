
# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi


[ -z "$PS1" ] && return

# replace plain shell with tmux session
if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi

###############################################
### Making the prompt as pretty as possible ###

# TERM=xterm-256colour

# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# High Intensty
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold High Intensty
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# High Intensty backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[10;95m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White


# define prompt

#if [ "$EUID" = "0" ] ; then
#    PS1='\h:\W# '
#else
# <red>[</red><white>TIME host:dir</white><red>]</red>
PS1="\[${IWhite}\][\[${White}\]\A \[${IWhite}\]\h\[${White}\]:\[${IRed}\]\W\[${IWhite}\]]\[${Color_Off}\] "
#fi



##############################################
### Shell settings ###

# Interactive settings
export ignoreeof=3

# update winsize after ever command
shopt -s checkwinsize
# check for slight mistakes
shopt -s cdspell
# save multiline commands as a single entry
shopt -s cmdhist

# do NOT print ^C when hitting ctrl-c
stty -echoctl

###############################################    
# Handy aliases

alias mv='mv -i'
alias cp='cp -i'
alias a=alias
alias h=history
alias df='df -k '
alias du='du -k '
alias su='su - '
alias bigfiles='du -ks ./ | sort -n -r | head -n 10'
alias resource='source ~/.bashrc'

alias ll='ls -l -G'
alias ltr='ll -tr'

alias nmr='ssh -X mhollen@entry.nmr.mgh.harvard.edu'
alias nx='ssh -L5022:cobham:22 -l mhollen door.nmr.mgh.harvard.edu'
alias vnc='ssh -L5901:cobham:5901 -l mhollen door.nmr.mgh.harvard.edu'

function cd () {
    pushd "$1" > /dev/null
}

alias bd="popd > /dev/null"

# words in file(s)
function words() {
    cat $@ | wc -w 
}

# lines in file(s)
function lines() {
    cat $@ | wc -l
}

# Extracts compressed files
extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}


# Finds directory sizes and lists them for the current directory
dirsize () {
    du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
    egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
    egrep '^ *[0-9.]*M' /tmp/list
    egrep '^ *[0-9.]*G' /tmp/list
    rm -rf /tmp/list
}

source /usr/local/bin/virtualenvwrapper.sh
