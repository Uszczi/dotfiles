#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

PATHS=$(find . -type d -name .venv -o -name __pycache__ -print)

if [[ -z $PATHS ]]; then
	echo 'No work to do.'
else
	echo 'Clearing:'
	printf '%s\n' "${PATHS[*]}"
	rm -r $PATHS
fi
