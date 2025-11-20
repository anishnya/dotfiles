# Add user local bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# Node module loading required for nvim Copilot
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Zinit Intialization
setopt GLOB_DOTS

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light jeffreytse/zsh-vi-mode
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light marlonrichert/zsh-autocomplete 

# Starship prompt
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

zinit ice from"gl" make 
zinit load dwt1/shell-color-scripts

# Rust
source $HOME/.cargo/env

# Editors
export VISUAL=nvim
export EDITOR="$VISUAL" 

# Other tools
eval "$(zoxide init zsh)"
alias bat='batcat'
alias ls='eza'
alias cd='z'

# Quick navigation
alias ..='z ..'
alias ...='z ../..'
alias ....='z ../../..'
alias .....='z ../../../..'

alias zl='zls'
zls() {
  z "$@" && eza -lAh
}

# Avoid fzf conflict
bindkey "^[[A" up-line-or-history
bindkey "^[[B" down-line-or-history

# fzf binds
# source <(fzf --zsh)
