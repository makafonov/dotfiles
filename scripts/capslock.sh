#!/bin/bash

FILE=~/.config/karabiner/assets/complex_modifications/capslock.json

if [ -f $FILE ]; then
  echo "File $FILE already exists"
else
  curl -s --create-dirs https://raw.githubusercontent.com/Vonng/Capslock/master/mac_v3/capslock.json -o $FILE
fi
