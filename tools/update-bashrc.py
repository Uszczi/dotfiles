#! /usr/bin/python

from pathlib import Path

MARKER = 42 * "#" + "\n"
ORIGIN = Path(__file__).parent.parent / "bashrc"
DEST = Path(__file__).home() / ".bashrc"

append_text = []

with open(ORIGIN) as f:

    found = False
    for line in f:
        if not found:
            if line == MARKER:
                found = True
        else:
            append_text.append(line)

    if append_text[-1] == MARKER:
        append_text.pop()

with open(DEST, "a") as f:
    f.write("\n\n\n")
    for line in append_text:
        f.write(line)
