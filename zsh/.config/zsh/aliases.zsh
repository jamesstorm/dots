alias sp='sudo pacman' 
alias c='clear'
alias n='nvim'
alias use="du -h -d 1"
alias rmr="rm -rf"
alias dcup="docker compose up -d --remove-orphans"
alias dcdown="docker compose down"
alias dcstop="docker compose stop"
alias dcstart="docker compose start"
alias dcrestart="docker compose restart"
alias vpnup="wg-quick up ./rumble.conf"
alias vpndown="wg-quick down ./rumble.conf"     
alias ls="ls --color=auto"                            # use ls colorfully
alias l="ls -ahl"                                      # l is ls
alias nw="alacritty msg create-window"                # open new window in alacritty
alias inv='nvim $(fzf --preview="bat --color always {}")'
alias gs='git status'
alias gpull='git pull'
alias gpush='git push'
alias gadd='git add'
alias gcom='git commit'
alias services='sudo systemctl list-units --type=service --state=running'
alias rb='sudo reboot now'
alias max='ssh james@max'
alias pve='ssh root@pve'
alias unlockuser='faillock --reset --user'
alias dot='cd ~/dotfiles'
alias ins='cd ~/installers/'
alias freec='QT_QPA_PLATFORM=xcb freecad'
alias vi=nvim
