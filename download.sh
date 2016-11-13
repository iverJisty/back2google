#!/bin/sh

key="files_in_Alpaca"       # Default key

if [ $# -eq 2 ]; then
    key=$2
fi

if [ $# -ge 1 ]; then
    ./gdrive list | grep $1.xz.enc | cut -d ' ' -f 1 | xargs ./gdrive download --stdout | pv | openssl aes-256-cbc -d -k $key | xzcat | sudo zfs recv $1
else
    echo "Usage : ./download.sh [snapshot] [key]"
    echo "Get $# arguments .. need more than one"
fi
