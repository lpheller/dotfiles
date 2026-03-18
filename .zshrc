eval "$(starship init zsh)"

# ZSH Plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load the shell dotfiles:
for file in ~/.dotfiles/shell/.{exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

export PATH="$HOME/.local/bin:$PATH"

# Herd
export PATH="$HOME/Library/Application Support/Herd/bin/":$PATH
for v in 81 82 83 84 85; do
  export HERD_PHP_${v}_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/${v}/"
done
