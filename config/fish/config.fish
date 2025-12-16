eval "$(/opt/homebrew/bin/brew shellenv fish)"

source $HOME/.config/fish/alias.fish
source $HOME/.cargo/env.fish

fish_add_path $(brew --prefix gnu-sed)/libexec/gnubin
fish_add_path /opt/homebrew/opt/openssl@1.1/bin
fish_add_path $HOME/yandex-cloud/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.krew/bin

set -U fish_greeting

set -gx EDITOR nvim
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx K9S_CONFIG_DIR "$HOME/.config/k9s"

# disabling bytecode (.pyc) files
set -gx PYTHONDONTWRITEBYTECODE 1
set -gx UV_PYTHON_PREFERENCE only-managed

set -gx CPPFLAGS "-I$(brew --prefix)/include"
set -gx LDFLAGS "-L$(brew --prefix)/lib"

# pkg-config
set _libs libffi icu4c@77
set -gx PKG_CONFIG_PATH $(for lib in $_libs; echo "$(brew --prefix $lib)/lib/pkgconfig"; end | string join ':')
set --erase _libs

# fzf
set -gx FZF_DEFAULT_COMMAND "fd --type f --strip-cwd-prefix"
if type -q fisher
  fzf_configure_bindings --directory=\cff --git_log=\cfl --git_status=\cfs --processes=\cfp --variables=\cfv
end

# nnn
set -gx NNN_PLUG 'f:finder;o:fzopen;p:preview-tui;d:diffs;t:nmount;v:imgview'
set -x NNN_FIFO '/tmp/nnn.fifo'

zoxide init fish | source
starship init fish | source
uv generate-shell-completion fish | source

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.fish 2>/dev/null || :
