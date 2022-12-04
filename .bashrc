# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

parse_git_branch(){
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\e[1;32m\u@\H\e[0m:\e[1;34m\W\e[38;5;135m\$(parse_git_branch)\e[0m$ "

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PATH="$HOME/.scripts:$PATH"
alias claer="clear"
alias reset="clear && cd"
alias ok="okular"
alias py="python3"

# Aliases for lsd command (looks epic!)
alias ls="lsd"
alias la="ls -a"
alias ll="ls -l"
alias li="ls -i"
alias lt="ls --tree"
alias lo="ll --permission octal"
alias lsr="ls -R"

# Aliases for tmux stuff
alias tls="tmux ls"

source ~/.bash_completion/alacritty

alias open="xdg-open"
. "$HOME/.cargo/env"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

