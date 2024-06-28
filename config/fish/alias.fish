alias ...='cd ../..'
alias cat='bat'
alias vi='nvim'
alias vim='nvim'
alias ptp='ptpython'
alias yt='yt-dlp -S "ext"'
alias config='/usr/local/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'

abbr -a -- gcd 'git checkout dev'

alias l='ls'
alias ls='eza -la --color=always --group-directories-first'
alias lt='eza -aT --color=always --group-directories-first'  # tree

alias c2="awk '{ print \$2 }'"
alias c3="awk '{ print \$3 }'"
alias c4="awk '{ print \$4 }'"
