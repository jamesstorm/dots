

#if [[ -z "$XDG_CONFIG_HOME" ]]; then 
#	export XDG_CONFIG_HOME="$HOME/.config"
#fi
#
#[[ -d "$XDG_CONFIG_HOME/zsh" ]] || mkdir $XDG_CONFIG_HOME/zsh
#export ZDOTDIR="$XDG_CONFIG_HOME/zsh/"
#




[ -f "${ZDOTDIR}/aliases.zsh" ] && source "${ZDOTDIR}/aliases.zsh"
[ -f "${ZDOTDIR}/options.zsh" ] && source "${ZDOTDIR}/options.zsh"
[ -f "${ZDOTDIR}/path.zsh" ] && source "${ZDOTDIR}/path.zsh"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=110000
SAVEHIST=100000

#export LC_ALL=C.UTF-8

bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/james/.zshrc'

autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
# End of lines added by compinstall


eval "$(oh-my-posh init zsh --config $XDG_CONFIG_HOME/ohmyposh/omp.toml)"
source $XDG_CONFIG_HOME/.zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $XDG_CONFIG_HOME/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
#source $ZDOTDIR/plugins/zsh-autocomplete-git/zsh-autocomplete.plugin.zsh


zstyle ':completion:*' menu yes select




export TERM=xterm-256color
## depending of xdg-utils
## https://github.com/theskumar/dotfiles/blob/master/.zsh/plugins/web_search/web_search.plugin.zsh

function web_search() {
  # get the open command
  local open_cmd
  [[ "$OSTYPE" = linux* ]] && open_cmd='xdg-open'
  [[ "$OSTYPE" = darwin* ]] && open_cmd='open'

  pattern='(google|duckduckgo|bing|yahoo|github|youtube|brave)'

  # check whether the search engine is supported
  if [[ $1 =~ pattern ]];
  then
    echo "Search engine $1 not supported."
    return 1
  fi

  local url
  [[ "$1" == 'yahoo' ]] && url="https://search.yahoo.com" || url="https://www.$1.com"
  [[ "$1" == 'brave' ]] && url="https://search.brave.com" || url="https://www.$1.com"


  # no keyword provided, simply open the search engine homepage
  if [[ $# -le 1 ]]; then
    $open_cmd "$url"
    return
  fi

  typeset -A search_syntax=(
    google     "/search?q="
    brave      "/search?q="
    bing       "/search?q="
    github     "/search?q="
    duckduckgo "/?q="
    yahoo      "/search?p="
    youtube    "/results?search_query="
  )

  url="${url}${search_syntax[$1]}"
  shift   # shift out $1

  while [[ $# -gt 0 ]]; do
    url="${url}$1+"
    shift
  done

  url="${url%?}" # remove the last '+'
  nohup $open_cmd "$url" &> /dev/null
}

alias brave='web_search brave'
alias bing='web_search bing'
alias google='web_search google'
alias yahoo='web_search yahoo'
alias ddg='web_search duckduckgo'
alias github='web_search github'
alias youtube='web_search youtube'

#add your own !bang searches here
alias wiki='web_search duckduckgo \!w'
alias news='web_search duckduckgo \!n'
alias map='web_search duckduckgo \!m'
alias image='web_search duckduckgo \!i'
alias ducky='web_search duckduckgo \!'




[ -f "${ZDOTDIR}/functions.zsh" ] && source "${ZDOTDIR}/functions.zsh"
