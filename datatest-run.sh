#!/bin/bash -ue

. settings.sh

borg init $REPO
cd $EXTRACT
for archive in "${ARCHIVES[@]}"; do
    IFS=,
    read cmd file url <<< "$archive"
    IFS=' '
    echo Creating $REPO::$file
    borg create ../$REPO::$file $file -C lz4
done

rm -rf $ARENA
for repo in $PWD/repository-*; do
    echo At $repo
    workdir=$ARENA/$(basename $REPO)/$(basename $repo)
    mkdir -p $workdir
    cd $workdir
    for archive in "${ARCHIVES[@]}"; do
        IFS=,
        read cmd file url <<< "$archive"
        IFS=' '
        echo "  $file"
        borg extract $repo::$file
        diff -rq $file $EXTRACT/$file | wc -l | grep -q '^0$'
        rm -r $file
    done
done
rm -rf $ARENA
