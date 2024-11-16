# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin:/usr/local/texlive/2023/bin/x86_64-linux:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/io/.fzf/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export EDITOR=nvim
export VISUAL=nvim
export PATH="$PATH:/opt/nvim-linux64/bin"

# Path to antigen
source /home/io/antigen.zsh
antigen init ~/.antigenrc

# Open tmux automatically if installed and not already running
if [ "$TMUX" = "" ]; then tmux; fi

# Different theme for SSH connections.
# Top line is in case of SSH connection,
# "else" is default.
if [[ -n $SSH_CONNECTION ]]; then
    ZSH_THEME="agnoster"
else
    #ZSH_THEME="powerlevel9k/powerlevel9k"
    ZSH_THEME="eastwood"
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="jonathan"
# ZSH_THEME="simple"
# ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# plugins=(
#     zsh-autosuggestions
#     zsh-vi-mode
#     zsh-syntax-highlighting
# )

# PLUGINS MUST BE SOURCED BEFORE OH-MY-ZSH.SH IS SOURCED

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# alias / mapping / binding


alias blogout="kill -9 -1"
alias calcurse="calcurse -D ~/Sync/calcurse"
alias fzf="fzf --bind 'ctrl-v:execute(nvim {} < /dev/tty)'"
# alias ls="logo-ls"
alias music="musikcube"
alias rm='echo "Consider using trash-put (alias ttt) instead. If you want rm, type \\\rm."; false'
# alias tail="colortail"
alias texcompile="latexmk -lualatex"
alias thes="dict -d moby-thesaurus"
alias ttt="trash-put"

# Use like normal fzf, but the output is copied to the clipboard.
f()
{
	# https://stackoverflow.com/a/46726373/9157799
	if [ -p /dev/stdin ]  # if data was piped
	then
		stdin=$(</dev/stdin)
		echo "$stdin" | fzf "$@" | xclip
		fzo="$(xclip -o)"
	else
		fzo=$(fzf "$@")
	fi
	if [ "$fzo" != "" ]
	then
		echo -n "$fzo" | xclip -se c
		echo "$fzo"
	fi
}
function lazygit() {
    git add .
    git commit -am "$1"
    git push
}

function wordcount() {
    pdftotext "$1" - | tr -d '.' | wc -w
}

# Command will copy desired "locate" result (number)
# to the clipboard with format:
# > locatecopy something 1
locatecopy() {
    locate $1 | sed -n $2p | xsel -i -b
}

# Elapsed and execution time display for commands in ZSH
function preexec() {
  timer=$(($(date +%s%0N)/1000000))
}

function precmd() {
  if [ $timer ]; then
    now=$(($(date +%s%0N)/1000000))
    elapsed=$(($now-$timer))

    export RPROMPT="%F{cyan}${elapsed}ms %{$reset_color%}"
    unset timer
  fi
}
PATH="$HOME/.local/bin:$PATH"


alias google='function _google(){ w3m "https://www.google.com/search?q=$(echo "$*" | sed "s/ /+/g")"; }; _google'

alias duck='function _duck(){ w3m "https://duckduckgo.com/?q=$(echo "$*" | sed "s/ /+/g")"; }; _duck'

# Nodejs
VERSION=v10.15.0
DISTRO=linux-x64
export PATH=/usr/local/lib/nodejs/node-v20.9.0-linux-x64/bin:$PATH
