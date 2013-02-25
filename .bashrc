#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
GREENFG='\[\e[0;32m\]'
GREENFG2='\[\e[1;32m\]'
REDFG='\[\e[1;31m\]'
BLUEFG='\[\e[1;34m\]'
UNCOLORED='\[\e[m\]'

source /usr/share/git/completion/git-prompt.sh
#source /etc/bash_completion.d/git
export PS1="$GREENFG\u@\h$REDFG\$(__git_ps1) $BLUEFG\w \n$GREENFG2↳ $UNCOLORED"

set -o vi

complete -cf sudo
complete -c man

export EDITOR=vim

export PATH="/usr/lib/colorgcc/bin:$PATH:$HOME/bin"
#conky|dzen2 -x 150 -y 785 -bg black -w 800 -expand left

# sudo rename .txt .csv *.txt 
alias lock='i3lock -i /home/jrussell/wallpapers/archlinuxBlack.png'
alias fixmouse='sudo modprobe -r psmouse && sudo modprobe -a psmouse'
alias grep='grep --color'
alias fgrep='fgrep --color'
alias egrep='egreap --color'
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -l --color=auto'
alias gist='git status'

# colorize man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}
