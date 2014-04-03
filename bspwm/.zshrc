ZSH=/usr/share/oh-my-zsh/

autoload -U promptinit
promptinit

autoload -Uz compinit
compinit


# .dir_colors!
if [[ -f ~/.dir_colors ]]; then
        eval $(dircolors -b ~/.dir_colors)
elif [[ -f /etc/DIR_COLORS ]]; then
        eval ~(dircolors -b /etc/DIR_COLORS)
else
        eval $(dircolors)
fi

HIST_STAMPS="mm/dd/yyyy"

# opening from current dir (termite feature)
if [[ $TERM == xterm-termite ]]; then
        . /etc/profile.d/vte.sh
        __vte_osc7
fi

export EDITOR="vim"
export GTK2_RC_FILES="/home/fenriz/.config/gtk-2.0/gtkrc"

# Some aliases
alias ls="ls --color=auto --group-directories-first"
alias dir="dir --color=auto"
alias grep="grep --color=auto"
alias dmesg="dmesg --color"
alias rm="rm -iv"
alias firefox="GTK2_RC_FILES=/home/fenriz/.config/gtk-2.0/gtkrc firefox"
alias sshp="ssh server@NOT.MY.IP.HERE -p over9000 -t tmux a"
alias sshpo="ssh server@NOT.MY.IP.HERE -p over9000 -t tmux a"
alias sshu="ssh studentNumber@my.schools.host"
alias udg="sudo pacaur -Syyu"

# History search
[[ -n "${key[PageUp]}" ]] && bindkey "${key[PageUp]}" history-beginning-search-backward
[[ -n "${key[PageDown]}" ]] && bindkey "${key[PageDown]}" history-beginning-search-forward

# Set name of the theme to load.
ZSH_THEME="myown"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"


# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git)
plugins=(zsh-syntax-highlighting)

# Coloured man pages
man() {
        env LESS_TERMCAP_mb=$'\E[01;31m' \
        LESS_TERMCAP_md=$'\E[01;38;5;74m' \
        LESS_TERMCAP_me=$'\E[0m' \
        LESS_TERMCAP_se=$'\E[0m' \
        LESS_TERMCAP_so=$'\E[31;5;246m' \
        LESS_TERMCAP_ue=$'\E[0m' \
        LESS_TERMCAP_us=$'\E[04;38;5;146m' \
        man "$@"
}
source $ZSH/oh-my-zsh.sh
