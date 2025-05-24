eval "$(/opt/homebrew/bin/brew shellenv fish)"

source $HOME/.config/fish/alias.fish
source $HOME/.cargo/env.fish

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

fish_add_path $(brew --prefix gnu-sed)/libexec/gnubin
fish_add_path $(brew --prefix openssl@1.1)/bin
fish_add_path $HOME/yandex-cloud/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.krew/bin

set -U fish_greeting

set -gx EDITOR nvim
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx ASDF_DATA_DIR "$HOME/.asdf"

# disabling bytecode (.pyc) files
set -gx PYTHONDONTWRITEBYTECODE 1
set -gx UV_PYTHON_PREFERENCE only-managed

set _libs openssl@1.1 libffi zlib libxslt libxml2 icu4c@77
set -gx LDFLAGS $(for lib in $_libs; echo "-L$(brew --prefix $lib)/lib"; end | string join ' ')
set -gx CPPFLAGS $(for lib in $_libs aspell; echo "-I$(brew --prefix $lib)/include"; end | string join ' ')

# pkg-config
set _libs libffi icu4c@77
set -gx PKG_CONFIG_PATH $(for lib in $_libs; echo "$(brew --prefix $lib)/lib/pkgconfig"; end | string join ':')
set --erase _libs

# silence the console output of direnv
set -gx DIRENV_LOG_FORMAT ""

set -gx BAT_THEME "DarkNeon"

# fzf
if type -q fisher
  fzf_configure_bindings --directory=\cff --git_log=\cfl --git_status=\cfs --processes=\cfp --variables=\cfv
  set fzf_fd_opts --hidden --exclude=.git
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
