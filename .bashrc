# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

export PATH="/usr/local/cuda/bin:$PATH"
export GOPATH="/home/echavemann/go"

unset rc
. "$HOME/.cargo/env"
eval "$(starship init bash)"
eval "$(zoxide init bash)"

export PATH="$PATH:/opt/nvim-linux64/bin"
export COLORTERM="truecolor"
source /usr/share/bash-completion/completions/git
__git_complete g __git_main

alias ls="eza --icons -F -H --group-directories-first --git"
alias lsa="ls -a"
alias cd=z
alias g=git
alias v=nvim
alias t=task
alias m=make

export FZF_DEFAULT_OPTS='--tmux center,70%,70% --layout reverse --border top'
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always {}' --multi"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(fzf --bash)"

alias jump='function _jump(){ ssh echavemann@walkus-op-$1.tail4bf1b.ts.net; }; _jump'
alias wssh='ssh -i ~/.ssh/walkway_ed25519'
