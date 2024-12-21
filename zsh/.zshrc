### ZINIT ###
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# oh my posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.yml)"

# syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting

# auto-completions
zinit light zsh-users/zsh-completions
autoload -U compinit && compinit

# auto-suggestions
zinit light zsh-users/zsh-autosuggestions
# persist history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

### KEYBINDINGS ###
# Navigation
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# Autosuggest
bindkey '^y' autosuggest-accept
bindkey '^e' autosuggest-clear
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

### ALIASES ###
alias la='ls -A'
alias cat='bat'
alias vimf='vim $(fzf -m --preview="bat --color=always {}")'

### INTEGRATIONS ###
eval "$(fzf --zsh)"
zinit light Aloxaf/fzf-tab
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

