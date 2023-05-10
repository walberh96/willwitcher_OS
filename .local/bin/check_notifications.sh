#!/bin/bash

if [[ "$(dunstctl is-paused)" == "false" ]]; then
    echo "%{F#f40460}%{F-}"
else
    echo "%{F#666666}%{F-}"
fi

