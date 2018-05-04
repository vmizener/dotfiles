###########
# Apr 30 2018
# - Added color codes
# - Updated default umask to 002
# - Now detects and breaks early on non-interactive shells
# - Now always prints screen session info on startup
#
# Apr 28 2018
# - Reorganized path to favor local paths
#
# Apr 27 2018
# - Added home/end keybinds
# - Made the $HOME/core/bin path dynamic
#
# Apr 18 2018
# - Added vi alias
# - Added session info dump
#
# Apr 17 2018
# - Created
# - Basic PATH construction
# - ls colors alias
# - resrc alias


###########
# Init work

# Break early on non-interactive shell
[ -z "$PS1" ] && return

# Set umask to give group write permissions
# (Default is 022)
umask 002

# Color variables for convenience
local c_blk='\033[0;30m' # Text Black
local c_red='\033[0;31m' # Text Red
local c_grn='\033[0;32m' # Text Green
local c_ylw='\033[0;33m' # Text Yellow
local c_blu='\033[0;34m' # Text Blue
local c_cyn='\033[0;36m' # Text Cyan
local c_wht='\033[0;37m' # Text White
local b_blk='\033[1;30m' # Bold black
local b_red='\033[1;31m' # Bold red
local b_grn='\033[1;32m' # Bold green
local b_ylw='\033[1;33m' # Bold yellow
local b_blu='\033[1;34m' # Bold blue
local b_cyn='\033[1;36m' # Bold cyan
local b_wht='\033[1;37m' # Bold white
local g_blk='\033[40m'   # Background black
local g_red='\033[41m'   # Background red
local g_grn='\033[42m'   # Background green
local g_ylw='\033[43m'   # Background yellow
local g_blu='\033[44m'   # Background blue
local g_cyn='\033[46m'   # Background cyan
local g_wht='\033[47m'   # Background white
local c_rst='\033[0m'    # Reset color

# Build path
PATH=.
PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/sbin
PATH=$PATH:/usr/bin
PATH=$PATH:/sbin
PATH=$PATH:/bin
PATH=$PATH:/opt/X11/bin

[ -d $HOME/core/bin ] && PATH=$PATH:$HOME/core/bin

export PATH

###########
# Startup

function _dump {
    date
    if [ -n "${STY+x}" ] 
        then echo -e "Session ID:\t${c_wht}${STY}${c_rst}"
        else echo -e "Session ID:\t${c_red}<No Session>${c_rst}"
    fi
    echo -e "Logged in as:\t${c_wht}`whoami`${c_rst}"
}
alias dump='_dump'
dump

# Make home and end keys work
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line 

###########
# Aliases

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias ls='ls -GFh'
alias resrc='. ~/.zshrc'
alias vi='vim'
