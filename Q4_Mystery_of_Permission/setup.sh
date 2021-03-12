#!/bin/bash

rm -rf repo
mkdir repo
cd repo
git init
touch 600.txt 700.txt
chmod 600 600.txt
chmod 700 700.txt
git add 600.txt 700.txt
git commit -a -m "add 600.txt 700.txt"
rm 600.txt 700.txt
git checkout HEAD 600.txt 700.txt
