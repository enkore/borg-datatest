#!/bin/bash -ue

. settings.sh

mkdir -p $DOWNLOAD $EXTRACT

for archive in "${ARCHIVES[@]}"; do
    IFS=,
    read cmd file url <<< "$archive"
    IFS=' '
    if [ -f $DOWNLOAD/$file ]; then
        echo Skipping "$url"
        continue
    fi
    echo Downloading "$url" ...
    wget --no-verbose --limit-rate=$RATELIMIT -O $DOWNLOAD/$file $url
    cd $EXTRACT
    rm -rf $file
    eval $cmd $DOWNLOAD/$file
    cd ..
done
