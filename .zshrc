export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# OH-MY-ZSH CONFIG
ZSH_THEME="robbyrussell"
plugins=(git docker docker-compose sudo)
source $ZSH/oh-my-zsh.sh

# ALIASES
alias c="clear"
alias h="history"
alias getip="echo $(ipconfig getifaddr $(route -n get default|awk '/interface/ { print $2 }')); echo;"
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias ssh-rt-prod="ssh emils@167.99.44.209"
alias ssh-rt-dev="ssh emils@128.199.44.57"
alias ssh-glimble-test="ssh arriva@3.77.87.45"
alias ssh-glimble-it-test="ssh arriva@54.72.83.121"
alias ssh-glimble-acc="ssh arriva@3.75.28.1"
alias ssh-glimble-it-acc="ssh arriva@34.247.76.203"
alias ssh-glimble-prod="ssh arriva@18.195.87.70"
alias glimble="cd ~/Documents/code/work/glimble/glimble-webshop"

alias polly="cd ~/Documents/code/work/polly-pwa"
alias ssh-polly-test="ssh parnassia@3.70.35.222"
alias ssh-polly-acc="ssh parnassia@18.185.153.241"
alias ssh-polly-prod="ssh parnassia@3.121.145.134"

## GIT
GIT_AUTHOR_NAME="Emils Bernhards"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="emilsbernhards2001@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

# CUSTOM FUNCTIONS
function ticket() {
  A="$(git log -1 --pretty=%B)"
  B="$(echo $A | cut -d'[' -f2)"
  C="$(echo $B | awk '{sub(/].*/,x)}1')"
  echo $C && echo $C | tr -d '\n' | pbcopy;
}

function code() {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}

# bun completions
[ -s "/Users/emils/.bun/_bun" ] && source "/Users/emils/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
