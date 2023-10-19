alias ...='cd ../..'
alias cat='bat'
alias vi='nvim'
alias vim='nvim'
alias ptp='ptpython'
alias vault='cd "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/vault"'
alias yt='yt-dlp -S "ext"'
alias config='/usr/local/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'

abbr -a -- gcd 'git checkout dev'

# alias tig='tig --after=2021-01-01'

# ls to exa
alias l='ls'
alias ls='exa -la --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'  # tree
