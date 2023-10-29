import os
import random
import pathlib


def write_new_wallpaper(file, path):
    # There may be multiple monitors
    lines = []
    for i, line in enumerate(file):
        if line.startswith("file"):
            lines.append(i)

    new_line = f"file={path}\n"
    for line in lines:
        file[line] = new_line


def main():
    nitrogen_path = pathlib.Path.home() / ".config/nitrogen/bg-saved.cfg"
    wallpapers_path = pathlib.Path.home() / "dotfiles/wallpapers/"

    with open(nitrogen_path) as f:
        nitrogen_file = f.readlines()

    wallpapers = os.listdir(wallpapers_path)
    random_wallpaper = random.choice(wallpapers)

    new_wallpaper = f"{wallpapers_path}/{random_wallpaper}"
    write_new_wallpaper(nitrogen_file, new_wallpaper)

    with open(nitrogen_path, "w") as f:
        f.writelines(nitrogen_file)


if __name__ == "__main__":
    main()
