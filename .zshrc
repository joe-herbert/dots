# Set my prompt
fpath+=$HOME/.zsh/typewritten
autoload -U promptinit; promptinit
prompt typewritten

# Load my aliases 
[ -f ~/.config/aliases ] && source ~/.config/aliases

# History in cache directory
HISTFILE=~/.cache/zsh/zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Automatically cd into directories by just typing the directory name
setopt autocd

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)	
[ ! -d "$HOME/.cache/zsh" ] && mkdir "$HOME/.cache/zsh"
compinit -d "$HOME/.cache/zsh/zcompdump"

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Allows me to run scripts which are installed locally
export PATH=$PATH":$HOME/.local/bin"

# Scripts installed using gem
export PATH=$PATH":$HOME/.gem/ruby/2.6.0/bin"

# Scripts installed using cargo
export PATH=$PATH":$HOME/.cargo/bin"

# Allow files in bin
export PATH=$PATH":$HOME/bin/"

# Allow all files in bin and the subdirs to be in PATH
#export PATH=$PATH$( find $HOME/bin/ -type d -printf ":%p" )

# Go installed scripts
export PATH=$PATH":$HOME/.local/share/go/bin/"

export GOPATH="$HOME/go"

export PATH=$PATH:$GOPATH/bin


### VIM mode config
# Summery:
#  Allows you to use press ESC and then use VIM keys to edit
#  the command currently have in the command line.
#  When you are in INSERT mode, the cursor is a beam and in 
#  NORMAL mode, the cursor is a BLOCK. This makes it easer for us
#  to know what mode we are in.

#bindkey -e
# Activate vim mode.
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Jump to beginning using H and the end using L in NORMAL mode
bindkey -M vicmd 'H' beginning-of-line
bindkey -M vicmd 'L' end-of-line
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# Open current command line in vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd ' ' edit-command-line

# This brings the cursor back to the beam instead of the block cursor
_fix_cursor() {
   echo -ne '\e[5 q'
}

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

precmd_functions+=(_fix_cursor)


# Disable ctrl-s and ctrl-q because they for some reason
# freezes my terminal
stty -ixon 

# This file has some important variables
# source $HOME/.zprofile

# Load my ZSH plugins
source ~/bin/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle kutsan/zsh-system-clipboard
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle supercrabtree/k
antigen bundle git
antigen bundle Tarrasch/zsh-autoenv
antigen apply

# Config for kunst
export KUNST_SIZE="250x250"
export KUNST_MUSIC_DIR="$HOME/music/"

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' matcher-list '' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/home/joe/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval $(thefuck --alias)

PROMPT_EOL_MARK=''
clear
neofetch --disable gpu
cd ~/'#'
Uptime=$(</proc/uptime)
Uptime=${Uptime%%.*}
if [ "$Uptime" -lt "60" ]; then
    sleep 10
    wget -q --spider http://google.com
    if [ $? -eq 0 ]; then
        task sync
        pacu
    fi
fi
export PATH=$PATH:/home/joe/.spicetify
