#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\n\e[1;34m\w\e[0m\n\e[1;32m \e[0m'
