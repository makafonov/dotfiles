#!/bin/bash

FILE=~/.config/kitty/kitty.conf

if [ ! -f $FILE ]; then
  kitty +kitten themes --reload-in=all Rosé Pine Moon
fi


if ! grep -q "include main.conf" $FILE; then
  printf "\ninclude main.conf" >> $FILE
fi
