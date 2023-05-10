#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch wbar
echo "---" | tee -a /tmp/wbar1.log
polybar wbar 2>&1 | tee -a /tmp/wbar1.log & disown

echo "Wbar Launched"
