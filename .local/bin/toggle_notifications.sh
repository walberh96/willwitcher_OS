#!/bin/bash

if [[ "$(dunstctl is-paused)" == "true" ]]; then
  dunstctl set-paused false
  
else
  dunstctl set-paused true
fi

polybar-msg hook dunst 1
