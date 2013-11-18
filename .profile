export EDITOR='subl -w'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

source ~/dotfiles/git/git-prompt-settings
source ~/dotfiles/aliases

#prompt format
PS1='# \[\e[0;90m\]\t \[\e[0;32m\]\w \[\e[0;93m\]$(__git_ps1 "(%s)")\n\[\e[0m\]# '

#default folder:
cd ~/Development && clear
