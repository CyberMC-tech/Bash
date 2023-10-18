# bash_files=("env.bash" "functions.bash" "aliases.bash")
#
#
# for file in "${bash_files[@]}"; do
#   if [ -e "${HOME}/.config/bash/${file}" ]; then
#     source "${HOME}/.config/bash/${file}"
#   else
#     echo "Warning: File ${HOME}/.config/bash/${file} does not exist."
#   fi
# done
#

#########################################################################

# initilize zoxide 
eval "$(zoxide init bash --cmd)"

# Initilize the starship prompt
eval "$(starship init bash)"

# Initilize tab completions for starship
eval "$(starship completions bash)"

# Initilize completions for pipx
eval "$(register-python-argcomplete pipx)"

set -o vi

 source ~/.venv/bin/activate
# source ~/.config/bash/navi.bash
