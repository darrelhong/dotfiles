#!/bin/bash

if command -v fish > /dev/null; then
    echo "Fish is already installed."
else
    echo "Installing Fish shell..."
    
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
       if command -v apt > /dev/null; then
            sudo apt-get install software-properties-common -y
            sudo apt-add-repository ppa:fish-shell/release-3 -y
            sudo apt update -y
            sudo apt install fish -y
        elif command -v dnf > /dev/null; then
            sudo dnf install fish -y
        elif command -v pacman > /dev/null; then
            sudo pacman -S fish --noconfirm
        else
            echo "Unsupported Linux distribution."
            exit 1
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        if command -v brew > /dev/null; then
            brew install fish
        else
            echo "Homebrew is not installed. Please install Homebrew first."
            exit 1
        fi
    else
        echo "Unsupported OS"
    fi
fi

if ! grep -q "$(which fish)" /etc/shells; then
    echo "$(which fish)" | sudo tee -a /etc/shells
fi

echo "setting fish as default shell"
sudo chsh -s "$(which fish)"