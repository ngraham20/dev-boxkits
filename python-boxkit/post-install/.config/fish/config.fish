/home/linuxbrew/.linuxbrew/bin/brew shellenv | source
starship init fish | source
zoxide init fish | source
direnv hook fish | source

fish_add_path ~/.local/bin

set -gx EDITOR /home/linuxbrew/.linuxbrew/bin/hx
