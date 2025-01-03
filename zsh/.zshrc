### ZINIT ###
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# oh my posh
eval "$(oh-my-posh init zsh --config $XDG_CONFIG_HOME/ohmyposh/zen.yml)"
# syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting
# auto-completions
zinit light zsh-users/zsh-completions
autoload -U compinit && compinit
# auto-suggestions
zinit light zsh-users/zsh-autosuggestions
# nvm
zinit light lukechilds/zsh-nvm

# persist history
HISTSIZE=5000
HISTFILE=$XDG_STATE_HOME/zsh/.zsh_history
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
# exa: better ls / tree 
alias ls='exa'
alias la='exa -a' # pass -a 2 times to show . ..
alias ll='exa -alh --git'
alias tree='exa --tree'
# bat: better cat
alias cat='bat'
# combine vim with fzf and bat
alias vimf='vim $(fzf -m --preview="bat --color=always {}")'
# ntua vpn
alias ntua-vpn='sudo openvpn $XDG_STATE_HOME/vpn/ntua.ovpn'
# git
alias gs='git status'
alias lg='lazygit'
# create and enter directory
chdir ()
{
	mkdir -p -- "$1"
	cd "$1"
}

### PATH - NVM ETC ###
# conTeXt
export PATH="$PATH:/home/jbalatos/context/tex/texmf-linux-64/bin"
export OSFONTDIR="/usr/share/fonts"
# rvm
export PATH="$PATH:/home/jbalatos/.local/share/gem/ruby/3.3.0/bin"
[[ -r "$HOME/.rvm/scripts/completion" ]] && source "$HOME/.rvm/scripts/completion"

### INTEGRATIONS ###
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"
zinit light Aloxaf/fzf-tab
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

pfetch
