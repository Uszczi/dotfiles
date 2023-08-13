#! /bin/bash

echo "Installing oh-my-fish."
if [[ ! -d "$HOME/.local/share/omf" ]]; then
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
else
    echo "oh-my-fish exists."
    echo ""
fi


echo "Installing kitty."
if [[ ! -d "$HOME/.local/kitty.app" ]]; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
else
    echo "kitty exists."
    echo ""
fi

echo "Setting git user email and name."
git config --global user.email "mateuszpapuga24@gmail.com"
git config --global user.name "Mateusz Papuga"
echo ""

echo "Computer should be ready."

