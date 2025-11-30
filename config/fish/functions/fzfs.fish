function fzfs
    if not command -q rg
        echo "Error: ripgrep (rg) is not installed"
        return 1
    end
    if not command -q bat
        echo "Error: bat is not installed"
        return 1
    end
    
    set -l type_filter ""
    if test (count $argv) -gt 0
        set type_filter "-t $argv[1]"
    end
    
    set -l RELOAD "reload:rg --column --color=always --smart-case $type_filter {q} || :"
    
    fzf --disabled --ansi \
        --bind "start:$RELOAD" \
        --bind "change:$RELOAD" \
        --bind 'enter:become:pycharm --line {2} {1}' \
        --delimiter : \
        --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
        --preview-window '+{2}/3,<80(up)'
end