# neofetch --config ~/.config/neofetch/small/ozozfetch.conf
 echo "\n (.-.) \n\n {-.-} \n "
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
export DENO_INSTALL="/home/mirsahebali/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
# completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# Start oh my posh and set theme

# eval "$(oh-my-posh init zsh --config '~/.omp/space.omp.json')"

# ZSH_THEME="powerlevel10k/powerlevel10k"
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
    command-not-found
    golang
    man
    rust
    vi-mode
    zoxide
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
alias ta='tmux a'
alias kittyconf="cd ~/.config/kitty/ && nvim kitty.conf"
alias viconf='cd ~/.config/nvim/ && nvim .'
alias pb="~/pocketbase serve"
alias alacrittyconf="~/.config/alacritty && nvim"
alias vim=/usr/bin/nvim
alias vi=/usr/bin/vim
alias vi.="/usr/bin/vim ."
alias vim.="/usr/bin/nvim ."
alias qemu=qemu-system-x86_64
alias icat='echo kitty +kitten icat &&  kitty +kitten icat'
alias :q=exit
alias hconf="~/.config/hypr && nvim ."
alias air=~/go/bin/air
alias awconf="~/.config/awesome/ && nvim rc.lua"
alias docker="sudo docker"
alias dockerd="sudo dockerd"
alias zconf="nvim ~/.zshrc"
alias zc="nvim ~/.zshrc"
alias hc="alacritty -e nvim ~/.config/hypr/hyprland.conf"
alias wpconf="alacritty -e nvim ~/.config/hypr/hyprpaper.conf"
alias doom_emacs="emacs --init-directory=~/fun/emacs/"
alias update_all_dots="~/dots/scripts/update.sh"
alias update_doom="~/dots/scripts/update_doom.sh"
alias update_nvim="~/dots/scripts/update_nvim.sh"
alias update_emacs="~/dots/scripts/update_emacs.sh"
alias update_dots="~/dots/scripts/update_dots.sh"
alias rr="ranger"
alias hx="helix"
alias yy="yazi"
alias code="vscodium"
# Alias functions
rs_waybar(){
  ((killall waybar || waybar &) && waybar &) && ((killall waybar || waybar &) && waybar &)
}
mdr(){
 mkdir "$1" && cd "$1"
}
countdown() {
    dunstify Timer Started
    start="$(( $(date '+%s') + $1))"
    while [ $start -ge $(date +%s) ]; do
        time="$(( $start - $(date +%s) ))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
    dunstify Timer Ended
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
    echo "g++ $1.cpp -o $1 && sleep 1 && ./$1";
           g++ $1.cpp -o $1 && sleep 1 && ./$1
  else
    echo "gcc $1.c -o $1 && sleep 1 && ./$1";
          gcc $1.c -o $1 && sleep 1 && ./$1;
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

ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
[ -f "/home/mirsahebali/.ghcup/env" ] && source "/home/mirsahebali/.ghcup/env" # ghcup-env

# Starship zsh prompt
eval "$(starship init zsh)"

# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd() {
    \builtin pwd -L
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd() {
    # shellcheck disable=SC2164
    \builtin cd -- "$@"
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
function __zoxide_hook() {
    # shellcheck disable=SC2312
    \command zoxide add -- "$(__zoxide_pwd)"
}

# Initialize hook.
# shellcheck disable=SC2154
if [[ ${precmd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]] && [[ ${chpwd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]]; then
    chpwd_functions+=(__zoxide_hook)
fi

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

__zoxide_z_prefix='z#'

# Jump to a directory using only keywords.
function __zoxide_z() {
    # shellcheck disable=SC2199
    if [[ "$#" -eq 0 ]]; then
        __zoxide_cd ~
    elif [[ "$#" -eq 1 ]] && { [[ -d "$1" ]] || [[ "$1" = '-' ]] || [[ "$1" =~ ^[-+][0-9]$ ]]; }; then
        __zoxide_cd "$1"
    elif [[ "$@[-1]" == "${__zoxide_z_prefix}"?* ]]; then
        # shellcheck disable=SC2124
        \builtin local result="${@[-1]}"
        __zoxide_cd "${result:${#__zoxide_z_prefix}}"
    else
        \builtin local result
        # shellcheck disable=SC2312
        result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -- "$@")" &&
            __zoxide_cd "${result}"
    fi
}

# Jump to a directory using interactive search.
function __zoxide_zi() {
    \builtin local result
    result="$(\command zoxide query --interactive -- "$@")" && __zoxide_cd "${result}"
}

# Completions.
if [[ -o zle ]]; then
    function __zoxide_z_complete() {
        # Only show completions when the cursor is at the end of the line.
        # shellcheck disable=SC2154
        [[ "${#words[@]}" -eq "${CURRENT}" ]] || return 0

        if [[ "${#words[@]}" -eq 2 ]]; then
            _files -/
        elif [[ "${words[-1]}" == '' ]] && [[ "${words[-2]}" != "${__zoxide_z_prefix}"?* ]]; then
            \builtin local result
            # shellcheck disable=SC2086,SC2312
            if result="$(\command zoxide query --exclude "$(__zoxide_pwd)" --interactive -- ${words[2,-1]})"; then
                result="${__zoxide_z_prefix}${result}"
                # shellcheck disable=SC2296
                compadd -Q "${(q-)result}"
            fi
            \builtin printf '\e[5n'
        fi
        return 0
    }

    \builtin bindkey '\e[0n' 'reset-prompt'
    [[ "${+functions[compdef]}" -ne 0 ]] && \compdef __zoxide_z_complete __zoxide_z
fi

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

\builtin alias z=__zoxide_z
\builtin alias zi=__zoxide_zi

# =============================================================================
#
# To initialize zoxide, add this to your configuration (usually ~/.zshrc):
#
eval "$(zoxide init zsh)"

# opam configuration
[[ ! -r /home/mirsahebali/.opam/opam-init/init.zsh ]] || source /home/mirsahebali/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
PROMPT_EOL_MARK=''
