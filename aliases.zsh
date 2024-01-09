#!/usr/bin/env zsh

alias neof="clear && neofetch"
alias pipes="pipes.sh -t 3"
alias clock="tmux clock-mode"
alias matrix="cmatrix -a -b -s"
alias catterm="arttime --nolearn -a kissingcats -b kissingcats2 -t 'And you know I like you the best - Starry Cat' --ac 3"
alias tacoterm="arttime --nolearn -a taco -t 'Taco Terminal' --ac 3"


# Tmux
alias tmk="killall tmux;tmux new -Asmain"
alias tls="tmux ls "
alias tma="tmux a"
alias tm="tmux new -Asmain"

# File Explorer
alias n="nnn"
alias N="sudo -E nnn -dH"

# Disk Usage
alias df="duf"

# Benchmarks
alias fio1="fio --ioengine=libaio --direct=1 --sync=1 --rw=read --bs=4K --numjobs=1 --iodepth=1 --runtime=60 --time_based --name seq_read --filename=/dev/sda"
alias speed="speedtest-cli --simple"

# Initialize Github
alias conf="git --git-dir=$HOME/.dotfiles --work-tree=$HOME/.dotfiles"
