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

# Starship prompt
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

# Utilities
zi ice from"gh-r" as"program"
zi light ajeetdsouza/zoxide

zi ice from"gh-r" as"program"
zi light junegunn/fzf

zi ice from"gh-r" as"program"
zi light oppiliappan/eva

zi ice from"gh-r" as"program"
zi light printfn/fend

zi ice from"gh-r" as"program"
zi light Wilfred/difftastic/

zi ice from"gh-r" as"program"
zi light dalance/procs

zi ice from"gh-r" as"program"
zi light skim-rs/skim

zi ice from"gh-r" as"program"
zi light sharkdp/fd

zi ice from"gh-r" as"program"
zi light yamafaktory/jql

zi ice from"gh-r" as"program"
zi light sharkdp/bat

# Oh my zsh plugins
zinit snippet OMZP::screen
zinit snippet OMZP::sudo
zinit snippet OMZP::copybuffer
zinit snippet OMZP::copyfile
zinit snippet OMZP::copypath
zinit snippet OMZP::fzf

# Rust
source $HOME/.cargo/env

# Editors
export VISUAL=nvim
export EDITOR="$VISUAL" 

# Other tools
eval "$(zoxide init zsh)"
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

