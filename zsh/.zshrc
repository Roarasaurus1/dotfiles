## Directory to store zinit and plugins.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

## Download zinit if it doesn't exist.
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

## Source/load zinit.
source "${ZINIT_HOME}/zinit.zsh"


## Add in zsh plugins
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

## Zsh plugin snippets.
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
#zinit snippet OMZP::aws
#zinit snippet OMZP::kubectl
#zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

## Load completions
autoload -Uz compinit && compinit

## Replay cached completions.
zinit cdreplay -q

## Key bindings.
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
bindkey '^f' autosuggest-accept
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

## Completion styling.
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
export LESSOPEN='|~/.lessfilter %s'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls -la  --color $realpath'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

## Shell integrations.
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

## Run Starship.
eval "$(starship init zsh)"

# --- Aliases --- #
## Standard.
alias zource='source ~/.zshrc'
alias ls='ls --color'
alias ll='ls -la'
alias serialusb='sudo picocom /dev/ttyUSB0'
alias ip='ip -c'
alias grep='grep --colour=auto'
alias neofetch='fastfetch'
alias diff='diff -y --color'

## Micron21 general.
alias chkcp="check-cwh-users"
alias mcloudaccess="ssh mcloudaccess@172.25.1.126"
alias openstackcli="sudo docker run --rm --net=host -ti openstack-client bash"

## M21 servers.
alias qutjb='ssh nicolas.evangelista@27.131.108.98'
alias cp011='ssh -p22 nicolas.evangelista@cp-kil-m-011.micron21.com'
alias cp012='ssh -p22 nicolas.evangelista@cp-kil-m-012.micron21.com'
alias cp013='ssh -p22 nicolas.evangelista@cp-kil-m-013.micron21.com'
alias cp014='ssh -p22 nicolas.evangelista@cp-kil-m-014.micron21.com'
alias cp015='ssh -p22 nicolas.evangelista@cp-kil-m-015.micron21.com'
alias cp016='ssh -p22 nicolas.evangelista@cp-kil-m-016.micron21.com'
alias cp017='ssh -p22 nicolas.evangelista@cp-kil-m-017.micron21.com'
alias cp018='ssh -p22 nicolas.evangelista@cp-kil-m-018.micron21.com'
alias cp019='ssh -p22 nicolas.evangelista@cp-kil-m-019.micron21.com'
alias cp021='ssh -p22 nicolas.evangelista@cp-kil-m-021.micron21.com'
alias cp022='ssh -p22 nicolas.evangelista@cp-kil-m-022.micron21.com'
alias cp023='ssh -p22 nicolas.evangelista@cp-kil-m-023.micron21.com'
alias cpsb001='ssh -p22 nicolas.evangelista@cpsb-kil-m-001.micron21.com'
alias cptest='ssh -p22 nicolas.evangelista@cp-kil-cwh-test.micron21.com'
alias swh001='ssh -p22 nicolas.evangelista@cp-kil-swh-001.micron21.com'
alias swh002='ssh -p22 nicolas.evangelista@cp-kil-swh-002.micron21.com'
alias swh003='ssh nicolas.evangelista@cp-kil-swh-003.micron21.com'
alias swh004='ssh -p22 nicolas.evangelista@cp-kil-swh-004.micron21.com'
alias swh005='ssh -p22 nicolas.evangelista@cp-kil-swh-005.micron21.com'
alias swh006='ssh -p22 nicolas.evangelista@cp-kil-swh-006.micron21.com'
alias swh007='ssh -p22 nicolas.evangelista@cp-kil-swh-007.micron21.com'
alias swh008='ssh -p22 nicolas.evangelista@cp-kil-swh-008.micron21.com'
alias swh009='ssh -p22 nicolas.evangelista@cp-kil-swh-009.micron21.com'
alias swh010='ssh nicolas.evangelista@cp-kil-swh-010.micron21.com'
alias swh011='ssh -p22 nicolas.evangelista@cp-kil-swh-011.micron21.com'
alias rwh001='ssh -p22 nicolas.evangelista@cp-kil-rwh-001.micron21.com'
alias rwh002='ssh -p22 nicolas.evangelista@cp-kil-rwh-002.micron21.com'
alias swhsb001='ssh -p22 nicolas.evangelista@cpsb-kil-swh-001.micron21.com'
alias swhsb002='ssh -p22 nicolas.evangelista@cpsb-kil-swh-002.micron21.com'
alias ns1='ssh -p22 nicolas.evangelista@10.32.4.1'
alias ns2='ssh -p22 nicolas.evangelista@10.32.4.2'
alias ns3='ssh -p22 nicolas.evangelista@ns3.m21dns.net'
alias ns4='ssh -p22 nicolas.evangelista@ns4.m21dns.net'
alias imapsync="ssh -i ~/.ssh/id_rsa nicolas.evangelista@172.25.1.226"
alias swhsmtp01='ssh root@smtp-cwh-01.micron21.com'

## M21 customer servers.
# Mindwire
alias mindwire-cp01="ssh -p21212 -i ~/.ssh/m21_id_rsa root@27.131.106.10"

# Web Factory.
alias wf-thefold="ssh -p21212 -i ~/.ssh/m21_id_rsa root@103.204.106.20"
alias wf-nebula="ssh root@nebula.webfactory.com.au"
alias wf-groot="ssh root@groot.webfactory.com.au"
alias wf-rocket="ssh root@rocket.webfactory.com.au"
alias wf-starlord="ssh root@starlord.webfactory.com.au"
alias wf-kerio="ssh micron21-admin@connect.webfactory.com.au -p21212"

# Ace Communications.
alias acecom="ssh -p21212 -i ~/.ssh/m21_id_rsa root@cp-kil-ace-001.micron21.com"

# Velocity Host.
alias vh6="ssh -p21212 -i ~/.ssh/m21_id_rsa root@cpanel-vh6.velocityhost.com.au"
alias vh7="ssh -p21212 -i ~/.ssh/m21_id_rsa root@cpanel-vh7.velocityhost.com.au"
alias vh8="ssh -p21212 -i ~/.ssh/m21_id_rsa root@cpanel-vh8.velocityhost.com.au"
alias vh-hostcake="ssh -p21212 -i ~/.ssh/m21_id_rsa root@103.198.42.146"

# Pelicano.
alias pellicano-cp01="ssh -p21212 -i ~/.ssh/m21_id_rsa root@27.131.81.141"
alias pellicano-cp02="ssh -p21212 -i ~/.ssh/m21_id_rsa root@27.131.81.149"

# Creative Unit.
alias creativeunit-cp01="ssh -p21212 root@cp-01.creativeunit.com.au -i ~/.ssh/m21_id_rsa"

# Southern Impact.
alias sourthernimpact-cp04="ssh root@cp-04.busplus.com.au -i ~/.ssh/m21_id_rsa -p 21212"
alias sourthernimpact-cp05="ssh root@cp-05.southernimpact.com.au -i ~/.ssh/m21_id_rsa -p 21212"

# Exigence.
alias exigence-cp01-hwholdsworth="ssh root@cp-01.hwholdsworth.com.au -i ~/.ssh/m21_id_rsa -p 21212"

# ?
alias nuvis="ssh -i ~/.ssh/m21_id_rsa root@27.131.74.31"
