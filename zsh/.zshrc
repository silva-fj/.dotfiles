export TERM="xterm-256color"

DEFAULT_USER=$USER
HIST_STAMPS="yyyy-mm-dd"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

plugins=(
  git z zsh-autosuggestions zsh-nvm zsh-better-npm-completion zsh-syntax-highlighting aliases tmux dotenv
)

source $ZSH/oh-my-zsh.sh

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  if [ -x "$(command -v nvr)" ]; then
    alias nvim=nvr
  else
    alias nvim='echo "No nesting, use nvr instead"'
  fi
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh-nvm config
export NVM_DIR=~/.nvm
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export NVM_AUTO_USE=true

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_NDK_HOME=""
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH="$PATH:$HOME/Development/flutter/bin"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
export GEM_HOME="$HOME/.gem"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="$PATH:$HOME/Library/Python/3.7/bin"
export PATH="/usr/local/opt/llvm/bin:$PATH"

alias luamake=$HOME/.dotfiles/nvim/.config/nvim/lua-language-server/3rd/luamake/luamake
alias android-emulator="$ANDROID_HOME/emulator/emulator"
alias lg='lazygit'
alias pn=pnpm

export export KUBECONFIG=~/.kube/config KUBE_CONFIG_PATH=~/.kube/config
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Changes the ulimit limits.
ulimit -n 10240     # Increase open files.
ulimit -l unlimited # Increase max locked memory.

eval "$(starship init zsh)"
