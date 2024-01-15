#! /bin/bash

echo "Installing pyenv."
if [[ ! -d "$HOME/.pyenv" ]]; then
	curl https://pyenv.run | bash
else
    echo "pyenv exists."
    echo ""
fi
