#!/bin/bash

find . -mindepth 1 -type d | while read f;
do
    echo "Creating $f";
    adb < /dev/null shell mkdir storage/emulated/0/Music/\""$f"\"; 
done;

find . -mindepth 1 -type f | while read f; 
do
    adb < /dev/null push --sync "$f" storage/emulated/0/Music/"${f%/*.mp3}"; 
done;

