eval "$(/opt/homebrew/bin/brew shellenv fish)"

source $HOME/.config/fish/alias.fish
source "$(brew --prefix asdf)"/libexec/asdf.fish

fish_add_path $(brew --prefix gnu-sed)/libexec/gnubin
fish_add_path $(brew --prefix openssl@1.1)/bin
fish_add_path $HOME/.local/bin

set -U fish_greeting

set -gx EDITOR nvim
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

# disabling bytecode (.pyc) files
set -gx PYTHONDONTWRITEBYTECODE 1

set -gx LDFLAGS $(for lib in openssl@1.1 libffi zlib libxslt libxml2; echo "-L$(brew --prefix $lib)/lib"; end | string join ' ')
set -gx CPPFLAGS $(for lib in openssl@1.1 libffi zlib libxslt libxml2 aspell; echo "-I$(brew --prefix $lib)/include"; end | string join ' ')

# For pkg-config to find libffi
set -gx PKG_CONFIG_PATH "$(brew --prefix libffi)/lib/pkgconfig"

# silence the console output of direnv
set -gx DIRENV_LOG_FORMAT ""

set -gx BAT_THEME "DarkNeon"

# ssh kitty hack
if test "$TERM" = "xterm-kitty"
  alias ssh="kitty +kitten ssh"
end

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
