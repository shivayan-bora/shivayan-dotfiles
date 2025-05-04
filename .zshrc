# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"


# Add in Powerlevel10k
# zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in ZSH Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light ajeetdsouza/zoxide

# Add in snippets: See Snippets from https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins for whatever you need.
zinit snippet OMZP::git

# Load Completions
autoload -U compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh


# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
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

# Completion Styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'colorls $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'colorls $realpath'

# Aliases
alias ls='colorls'
alias vim='nvim'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"



# PATH Variable
# /opt/homebrew/opt/python@3.12/libexec/bin
export GOPATH=/Users/shivayanbora/go
export PATH=/Users/shivayanbora/.pyenv/versions/3.10.0/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/usr/local/go/bin:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Users/shivayanbora/.cargo/bin:/Users/shivayanbora/.fig/bin:/Users/shivayanbora/.local/bin:~/PersonalCodebases/nand2tetris/tools:/opt/homebrew/opt/mongodb-community@4.4/bin:$GOPATH/bin:/Users/shivayanbora/.local/bin/lazyman

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH" # Added for Yarn

# :/usr/local/share/dotnet:~/.dotnet/tools



# Library Path for C
export LIBRARY_PATH=/usr/local/lib
export C_INCLUDE_PATH=/usr/local/include
export LD_LIBRARY_PATH=/usr/local/lib

# Important Configurations and Paths

# API Keys and Tokens
# export GH_NPM_REGISTRY_TOKEN=""
# export ANTHROPIC_API_KEY=""
[ -f ~/.zsh_secrets ] && source ~/.zsh_secrets


# PYENV Config
# eval "$(pyenv init --path)"
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters

# NGROK Config
if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
fi

# Load Angular CLI autocompletion.
if command -v ng &>/dev/null; then
    source <(ng completion script)
fi

# Fig previous config - Replaced by Amazon Q
[[ -f "$HOME/fig-export/dotfiles/dotfile.zsh" ]] && builtin source "$HOME/fig-export/dotfiles/dotfile.zsh"

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
eval "$(starship init zsh)"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

# Pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Use GCC-14 for compiler
alias gcc=gcc-14
alias cc=gcc-14

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/homebrew/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<
export PATH="/Library/TeX/texbin:$PATH"


export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cli-ai/bin:$PATH"
# export NVIM_APPNAME="nvim-Lazyman"
alias web_nvim="NVIM_APPNAME=nvim-webdev nvim"
alias obs_nvim="NVIM_APPNAME=nvim nvim"

# bun completions
[ -s "/Users/shivayanbora/.bun/_bun" ] && source "/Users/shivayanbora/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export featureFlagsMountPath="/Users/shivayanbora/Codebases/gitops-centralized-cluster/feature-flags/portal/alpha/"

# Added by Windsurf
export PATH="/Users/shivayanbora/.codeium/windsurf/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
# Source the Lazyman shell initialization for aliases and nvims selector
# shellcheck source=.config/nvim-Lazyman/.lazymanrc
[ -f ~/.config/nvim-Lazyman/.lazymanrc ] && source ~/.config/nvim-Lazyman/.lazymanrc
# Source the Lazyman .nvimsbind for nvims key binding
# shellcheck source=.config/nvim-Lazyman/.nvimsbind
[ -f ~/.config/nvim-Lazyman/.nvimsbind ] && source ~/.config/nvim-Lazyman/.nvimsbind

nvm_use_default() {
  export NVM_DIR="$HOME/.nvm"
  if [ -s "$NVM_DIR/nvm.sh" ]; then
    \. "$NVM_DIR/nvm.sh"  # Load NVM
    
    # Get default version and ensure it's in PATH
    DEFAULT_VERSION=$(cat $NVM_DIR/alias/default 2>/dev/null)
    if [ -n "$DEFAULT_VERSION" ]; then
      export PATH="$NVM_DIR/versions/node/$DEFAULT_VERSION/bin:$PATH"
    fi
  fi
}

# Call the function to ensure NVM is loaded
nvm_use_default
