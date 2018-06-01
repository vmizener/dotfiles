# type 'spectrum_ls' in terminal to get colorcodes
local c_lightblue="%{$FG[111]%}"
local c_navyblue="%{$FG[004]%}"
local c_goldenrod="%{$FG[003]%}"
local c_neongreen="%{$FG[118]%}"
local c_brightred="%{$FG[196]%}"
local c_palegrey="%{$FG[243]%}"
local c_plainwhite="%{$FG[007]%}"

local c_reset="%{$reset_color%}"

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    local session=`hostname -i 2>/dev/null`
else
    local session='Localhost'
fi

local ret_status="%(?:${c_neongreen} ➜ :${c_brightred} ➜ )"
PROMPT="${c_lightblue}%~
${ret_status}${c_reset} "
RPROMPT='$(git_prompt_info) ${c_goldenrod}${session} ${c_navyblue}[${c_palegrey}%D{%K:%M}${c_navyblue}]${c_reset}'

ZSH_THEME_GIT_PROMPT_PREFIX="${c_lightblue}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${c_reset}"
ZSH_THEME_GIT_PROMPT_DIRTY=" ${c_brightred}✗${c_reset}"
ZSH_THEME_GIT_PROMPT_CLEAN=" ${c_neongreen}✔${c_reset}"
