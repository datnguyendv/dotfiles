# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Performance options
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
DISABLE_UPDATE_PROMPT=true

# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Static brew prefix (faster than calling brew --prefix)
export BREW_PREFIX="/opt/homebrew"
export DYLD_LIBRARY_PATH="$BREW_PREFIX/lib:$DYLD_LIBRARY_PATH"

# Optimized plugins - removed zsh-autocomplete to avoid conflicts
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting kubectl aliases)

# User configuration
bindkey '^L' autosuggest-accept

# Environment variables
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Aliases
alias zshconfig="source ~/.zshrc"
alias k="kubectl"
alias tf="terraform"
alias as="ansible"
alias ex="exit"
alias n="nvim"
alias istio="istioctl"

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Optimize compinit - only check cache once a day
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# Docker completions
fpath=(/Users/datnguyen/.docker/completions $fpath)

# Terraform completions
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# Lazy load fnm
fnm_load() {
  eval "$(fnm env)"
}
# Only load fnm when needed
function node npm npx fnm yarn pnpm {
  unfunction node npm npx fnm yarn pnpm
  fnm_load
  $0 "$@"
}

# Load p10k configuration
[[ ! -f ~/config/dotfiles/.p10k.zsh ]] || source ~/config/dotfiles/.p10k.zsh

# Load bash completions
autoload -U +X bashcompinit && bashcompinit
