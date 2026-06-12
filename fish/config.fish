source /usr/share/cachyos-fish-config/cachyos-config.fish

# bat
set -Ux BAT_THEME "TwoDark"

# fnm (Node version manager)
fnm env --use-on-cd | source

if status is-interactive
    # Commands to run in interactive sessions can go here
    alias projects="cd ~/Projects"
    alias clrtrash="rm -rf ~/.local/share/Trash/files/* ~/.local/share/Trash/info/*"
    alias clear="printf '\033[H\033[2J\033[3J'"
    alias gitconfig="echo ~/.gitconfig && cat ~/.gitconfig"
    alias ls="eza --color=always --long --git --icons=always --no-filesize --no-time --no-user --no-permissions"
    alias ll="eza --all --color=always --long --git --icons=always"
    alias cat="bat"
    alias xclip="xclip -selection clipboard"
    
    function killport
        test (count $argv) -eq 0 && echo "Usage: killport <port>" && return 1
        set pid (lsof -t -i:$argv[1] 2>/dev/null)
        test -n "$pid" && kill -9 $pid && echo "Process $pid killed on port $argv[1]" || echo "No process found on port $argv[1]"
    end
    
    # set SPACEFISH_PROMPT_ADD_NEWLINE false
    starship init fish | source
end