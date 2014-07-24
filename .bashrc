
[ -z "$PS1" ] && return


###############################################
### Making the prompt as pretty as possible ###

export TERM=xterm-256color
export EDITOR=vim
export VISUAL=vim

if [ -r ~/.bash_prompt ]; then
    source ~/.bash_prompt
fi

######################
# Shell Settings
######################

# Interactive settings
export ignoreeof=3

# update winsize after ever command
shopt -s checkwinsize
# check for slight mistakes
shopt -s cdspell
# save multiline commands as a single entry
shopt -s cmdhist

# use vi keybindings
set -o vi

# do NOT print ^C when hitting ctrl-c
stty -echoctl

######################
# Aliases 
######################

if [ -r ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi


######################
# Python 
######################

if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

######################
# Functions
######################

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


