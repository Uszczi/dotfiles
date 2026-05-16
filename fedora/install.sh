#!/bin/bash

set -euo pipefail

sudo dnf update

sudo dnf install --assumeyes sway

sudo dnf install --assumeyes neovim

sudo dnf install --assumeyes fzf
