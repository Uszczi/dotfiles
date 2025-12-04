#!/bin/bash

COUNT=10;

for ((i=1; i<=COUNT; i++)); do
  echo "[$i/$COUNT] Uruchamiam: $@"
  "$@"
done
