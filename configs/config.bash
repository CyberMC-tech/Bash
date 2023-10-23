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

# Helper function to see if command exists before calling init
_command_exists() {
  hash "${1}" 2>/dev/null
}

# Initilize the starship prompt & completions
_command_exists starship \
  && eval "$(starship init --print-full-init bash)" \
  && eval "$(starship completions bash)" \
  && export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# Initilize completions for pipx
_command_exists pipx && eval "$(register-python-argcomplete pipx)"

# initilize zoxide
_command_exists zoxide && eval "$(zoxide init bash)"

set -o vi

# Xmodmap for setting capslock to escape
# xmodmap -e "clear lock"
# xmodmap -e "keycode 66 = Escape"

