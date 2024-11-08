#!/usr/bin/env bash

# Terminate already running bar instances
polybar-msg cmd quit

# Launch wbar
echo "---" | tee -a /tmp/wbar1.log
polybar wbar 2>&1 | tee -a /tmp/wbar1.log & disown

echo "Wbar Launched"

# Launch wbar2
echo "---" | tee -a /tmp/wbar2.log
polybar wbar2 2>&1 | tee -a /tmp/wbar2.log & disown

echo "Wbar2 Launched"
