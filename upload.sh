#!/bin/sh

key="files_in_Alpaca"       # Default key

if [ $# -eq 2 ]; then
    key=$2
fi

if [ $# -ge 1 ]; then
    zfs send $1 | xz -zf - | openssl aes-256-cbc -k $key | ./gdrive upload - "$1.xz.enc"
else
    echo "Usage : ./upload.sh [snapshot] [key]"
    echo "Get $# arguments .. need more than one"
fi
