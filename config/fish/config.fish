#!/usr/bin/env fish

starship init fish | source
zoxide init fish | source

set -g fish_history_size 1000000

set -gx fish_complete_path "$XDG_CONFIG_HOME/fish/completions" $fish_complete_path

# fzf configuration
set -gx FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border"
set -gx FZF_DEFAULT_COMMAND "fd --type f"

function yazicd
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin z -- "$cwd" && eza -a --icons --group-directories-first
	end
	rm -f -- "$tmp" >/dev/null 2>&1
end

# # PATH configuration
# fish_add_path $BUN_INSTALL/bin
# fish_add_path $HOME/.local/bin
#
# # Environment setup
# if test -f "$HOME/.local/share/bin/env"
#     source "$HOME/.local/share/bin/env"
# end
#
# # Bun completions
# if test -f "/home/kristofers/.bun/_bun"
#     source "/home/kristofers/.bun/_bun"
# end
