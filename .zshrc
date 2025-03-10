## Directory to store zinit and plugins.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

## Download zinit if it doesn't exist.
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

## Source/load zinit.
source "${ZINIT_HOME}/zinit.zsh" 

## Run Starship.
eval "$(starship init zsh)"

## Zsh plugins.
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

## Zsh plugin snippets.
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
#zinit snippet OMZP::aws
#zinit snippet OMZP::kubectl
#zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

## Load completions.
autoload -U compinit && compinit

## Replay cached completions.
zinit cdreplay -q

## Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-review 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

## Key bindings.
bindkey '^f' autosuggest-accept
bindkey -e
bindkey '^p' history-search-backward
bindkey "^[[3~" delete-char

## History
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

## Aliases
alias ls='ls --color'
alias ll='ls -Lla'
alias serial='sudo picocom /dev/ttyUSB0'
alias ip='ip -c'
alias neofetch='fastfetch'

## Shell integrations.
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
