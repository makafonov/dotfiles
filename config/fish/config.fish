source ~/.config/fish/alias.fish

source /usr/local/opt/asdf/libexec/asdf.fish

fish_add_path /usr/local/sbin
# fish_add_path /usr/local/opt/openssl@1.1/bin
fish_add_path /usr/local/opt/openssl@3/bin
fish_add_path $HOME/.local/bin
fish_add_path /usr/local/opt/bzip2/bin

set -gx EDITOR nvim
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

# disabling bytecode (.pyc) files
set -gx PYTHONDONTWRITEBYTECODE 1

# For compilers to find libffi
# set -gx LDFLAGS "-L/usr/local/opt/libffi/lib -L/usr/local/opt/openssl@1.1/lib"
# set -gx CPPFLAGS "-I/usr/local/opt/libffi/include -I/usr/local/opt/openssl@1.1/include"
set -gx LDFLAGS "-L/usr/local/opt/libffi/lib -L/usr/local/opt/openssl@3/lib"
set -gx CPPFLAGS "-I/usr/local/opt/libffi/include -I/usr/local/opt/openssl@3/include"

# For pkg-config to find libffi
set -gx PKG_CONFIG_PATH "/usr/local/opt/libffi/lib/pkgconfig"

# silence the console output of direnv
set -gx DIRENV_LOG_FORMAT ""

# ssh kitty hack
if test "$TERM" = "xterm-kitty"
  alias ssh="kitty +kitten ssh"
end

# fzf
fzf_configure_bindings --directory=\cff --git_log=\сfl --git_status=\cfs --processes=\cfp --variables=\cfv
set fzf_fd_opts --hidden --exclude=.git --no-ignore

# nnn
set -gx NNN_PLUG 'f:finder;o:fzopen;p:preview-tui;d:diffs;t:nmount;v:imgview'
set -x NNN_FIFO '/tmp/nnn.fifo'

zoxide init fish | source
starship init fish | source
