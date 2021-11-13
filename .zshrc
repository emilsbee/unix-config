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

## GIT
GIT_AUTHOR_NAME="Emils Bernhards"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="bernhards@emils.xyz"
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

