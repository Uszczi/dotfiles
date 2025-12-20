# Dotfiles

Welcome to my Dotfiles repository where I store my configurations for various applications.

## Formaters for specific file types:
- Lua | [StyLua](https://github.com/JohnnyMorganz/StyLua)
- Python | [Black](https://github.com/psf/black)
- Json |
- Bash |

## Setting up a new environment
- Install password manager and git.
```bash
sudo apt update && sudo apt install 1password git make
```

- Login to Google and Github.

- Generate ssh key and setup at Github.
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"

cat ~/.ssh/id_ed25519.pub | xclip -selection clipboard
```

- Clone this repository and the private one.
```bash
git clone https://github.com/uszczi/dotfiles
cd dotfiles
git submodule init
git submodule update
```

- Run install software script.
```bash
make install
```

- Run Dotbot for symlinks.
```bash
make dotbot
``````

- Install Qtile.
Every time I use slightly different method.
```bash
git clone https://github.com/qtile/qtile
```

- Setup wallpaper.

[] Move all files to seperate folders
[] Automate ubuntu installation
