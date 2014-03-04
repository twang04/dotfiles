alias mv='mv -i'
alias cp='cp -i'
alias a=alias
alias h=history
alias df='df -k '
alias du='du -k '
alias su='su - '
alias resource='source ~/.bashrc'
alias ll='ls -alF --color'
alias ltr='ll -tr'
alias tmux='TERM=screen-256color-bce tmux -2'

# handy
alias bigfiles='du -ks ./ | sort -n -r | head -n 10'

# findcmd blah
# will find all executables in PATH that match 'blah'
alias findcmd='compgen -ac | grep '
