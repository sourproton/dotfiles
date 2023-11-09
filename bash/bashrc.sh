# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.config/bash/bash_aliases.sh
source ~/.config/bash/bash_env.sh
source ~/.config/bash/bash_prompt.sh
source ~/.config/bash/bash_exports.sh

shopt -s autocd
