neofetch --config ~/.config/neofetch/small/ozozfetch.conf

# zsh ~/.config/tmux/scripts/zsh.sh | grep piejflksjfskjflaskfjslkfjxoiwcjo

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export QT_QPA_PLATFORM=wayland
export ANDROID_HOME=$HOME/Android/Sdk
export HISTCONTROL=ignoreboth:erasedups
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export EDITOR="nvim"
export ARCHFLAGS="-arch x86_64"
export NVM_DIR="$HOME/.nvm"
export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"
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
export PATH=$PATH:/home/mirsahebali/.ghcup/bin
export PATH=$PATH:/home/mirsahebali/.config/emacs/bin
export PATH=$PATH:/usr/lib/
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
# completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# Start oh my posh and set theme
 
# eval "$(oh-my-posh init zsh --config '~/.omp/space.omp.json')"
 
ZSH_THEME="powerlevel10k/powerlevel10k"
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

setopt GLOB_DOTS
#share commands between terminal instances or not
unsetopt SHARE_HISTORY
#setopt SHARE_HISTORY

# If not running interactively, don't do anything

[[ $- != *i* ]] && return

# export LC_ALL=en_IN.UTF-8
# export LANG=en_IN.UTF-8


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

# Bun Completions
[ -s "/home/mirsahebali/.bun/_bun" ] && source "/home/mirsahebali/.bun/_bun"
# Sourcing oh-my-zsh
source $ZSH/oh-my-zsh.sh

#  Sourcing FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Compilation flags
  
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias li=lvim
alias tmuxconf="cd ~/.config/tmux/ && nvim tmux.conf"
alias viconf="cd ~/.config/nvim/ && nvim init.lua"
alias ta='tmux a'
alias vimconf="cd ~/.config/nvim/ && nvim"
alias kittyconf="cd ~/.config/kitty/ && nvim kitty.conf"
alias viconf='cd ~/.config/nvim/ && nvim .'
alias pb="~/pocketbase serve"
alias alacrittyconf="~/.config/alacritty && nvim"
alias vim=/usr/bin/nvim
alias vi=/usr/bin/vim 
alias qemu=qemu-system-x86_64
alias icat='echo kitty +kitten icat &&  kitty +kitten icat'
alias :q=exit
alias hyprconf="~/.config/hypr && nvim ."
alias air=~/go/bin/air
alias awconf="~/.config/awesome/ && nvim rc.lua"
alias docker="sudo docker"
alias zconf="nvim ~/.zshrc"
alias z="nvim ~/.zshrc"
alias hc="emacsclient -c ~/.config/hypr/config.org"
alias doom_emacs="emacs --init-directory=~/fun/emacs/"
alias update_all_dots="~/dots/scripts/update.sh"
alias update_doom="~/dots/scripts/update_doom.sh"
alias update_nvim="~/dots/scripts/update_nvim.sh"
alias update_emacs="~/dots/scripts/update_emacs.sh"
alias update_dots="~/dots/scripts/update_dots.sh"
alias rr="ranger"
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
    echo  g++ $1.cpp -o $1 && sleep 1 && ./$1
   g++ $1.cpp -o $1 && sleep 1 && ./$1
  else
    echo gcc $1.c -o $1 && sleep 1 && ./$1
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

[ -f "/home/mirsahebali/.ghcup/env" ] && source "/home/mirsahebali/.ghcup/env" # ghcup-env

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

