eval "$(/opt/homebrew/bin/brew shellenv)"
if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    source ~/.asdf/asdf.fish
end