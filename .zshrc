
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export QT_QPA_PLATFORM=wayland
export ANDROID_HOME=$HOME/Android/Sdk
export HISTCONTROL=ignoreboth:erasedups
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export EDITOR='nvim'
export ARCHFLAGS="-arch x86_64"
export NVM_DIR="$HOME/.nvm"
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export BUN_INSTALL="$HOME/.bun"
export PATH="/usr/lib/jvm/java-21-openjdk/bin/:$PATH"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.local/bin/":$PATH
export PATH="$HOME/bin/":$PATH
export PATH="/usr/bin/":$PATH
export PATH=$PATH:$HOME/.bin
export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/mirsahebali/go/bin

# completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# Start oh my posh and set theme
eval "$(oh-my-posh init zsh --config '~/.omp/space.omp.json')"

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

setopt GLOB_DOTS
#share commands between terminal instances or not
unsetopt SHARE_HISTORY
#setopt SHARE_HISTORY

# If not running interactively, don't do anything

[[ $- != *i* ]] && return

export LC_ALL=en_IN.UTF-8
#export LANG=en_IN.UTF-8


plugins=(git
    zsh-autosuggestions
    fd
    fzf
    npm
    themes
    copypath
    copyfile
    dirhistory
)

# bun completions
[ -s "/home/mirsahebali/.bun/_bun" ] && source "/home/mirsahebali/.bun/_bun"
#  Sourcing oh-my-zsh
source $ZSH/oh-my-zsh.sh

#  Sourcing fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Compilation flags
  
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Haskell GHC source
[ -f "/home/mirsahebali/.ghcup/env" ] && source "/home/mirsahebali/.ghcup/env" # ghcup-env
alias li=lvim
alias tmuxconf="cd ~/.config/tmux/ && vi tmux.conf"
alias viconf="cd ~/.config/nvim/ && vi init.lua"
alias tls='echo tmuxifier load-session &&  tmuxifier load-session'
alias tns='echo tmuxifier new-session &&  tmuxifier new-session'
alias tks='echo tmuxifier kill-session &&  tmuxifier kill-session'
alias tes='echo tmuxifier edit-session &&  tmuxifier edit-session'
alias ta='tmux a'
alias vimconf="cd ~/.config/nvim/ && vi"
alias ta='tmux attach'
alias kittyconf="cd ~/.config/kitty/ && vi kitty.conf"
alias viconf='cd ~/.config/nvim/ && vi .'
alias pb="~/pocketbase serve"
alias alacrittyconf="~/.config/alacritty && vi"
alias vi=nvim .bashrc
alias qemu=qemu-system-x86_64
alias pbs='echo ~/pocketbase serve &&  ~/pocketbase serve'
alias dk='echo drizzle-kit && drizzle-kit'
alias icat='echo kitty +kitten icat &&  kitty +kitten icat'
alias bringsvg="~/Downloads/*.svg ./src/svgs"
alias :q=exit
alias hyprconf="~/.config/hypr && vi ."
alias air=~/go/bin/air
alias awconf="~/.config/awesome/ && vi rc.lua"
alias docker="sudo docker"``
alias iv=nvim
alias v=nvim
alias qconf="cd ~/.config/qtile/ && vi ."
alias qrld="/home/mirsahebali/.config/qtile/reload.sh"
alias zconf="vi ~/.zshrc"
alias z="vi ~/.zshrc"
alias nt="tmux -c 'cd ~/org && nvim .'"
alias hc="vi ~/.config/hypr/hyprland.conf"
alias doom_emacs="emacs --init-directory=~/rice/emacs/"

# Alias functions
rs_waybar(){
  ((killall waybar || waybar &) && waybar &) && ((killall waybar || waybar &) && waybar &)
}
mdr(){
 mkdir "$1" && cd "$1"
}
countdown() {
    start="$(( $(date '+%s') + $1))"
    while [ $start -ge $(date +%s) ]; do
        time="$(( $start - $(date +%s) ))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}
stopwatch() {
    start=$(date +%s)
    while true; do
        time="$(( $(date +%s) - $start))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}
cfmt(){
  echo ~/.local/share/nvim/mason/bin/clang-format --style $1 --dump-config > .clang-format
  ~/.local/share/nvim/mason/bin/clang-format --style $1 --dump-config > .clang-format
}
co(){
  if [[ -f "$1.cpp" ]]; then
    echo  g++ $1.cpp -o $1 && ./$1
    g++ $1.cpp -o $1 && ./$1
  else
    echo gcc $1.c -o $1 && ./$1
    gcc $1.c -o $1 && ./$1
  fi
}
gitacp(){
  echo "git add . && git commit -m "$1" && git push -u origin $2"
  git add . && git commit -m "$1" && git push -u origin $2
}
restart_emacs(){
  if  pgrep emacs ; then
    killall -9 emacs 
    echo "KILLED EMACS"
    /usr/bin/emacs --daemon
  else
    /usr/bin/emacs --daemon
  fi
}
