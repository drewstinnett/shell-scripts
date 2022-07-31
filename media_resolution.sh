#!/usr/bin/env bash

if [[ ! -e "$1" ]]; then
        echo "Usage: $0 FILE|DIR" 1>&2
        exit 1
fi

for F in "$@"; do
        echo -e "$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$F")\t$F"
done
