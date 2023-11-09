# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# sources
source ~/.config/bash/bash_aliases.sh
source ~/.config/bash/bash_env.sh
source ~/.config/bash/bash_prompt.sh
source ~/.config/bash/bash_exports.sh

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# auto cd
shopt -s autocd
