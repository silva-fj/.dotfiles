# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/franciscosilva/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/franciscosilva/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/franciscosilva/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/franciscosilva/.fzf/shell/key-bindings.zsh"
