#!/bin/bash

# git init だけしたリポジトリを作る
repo_init(){
    mkdir $1
    cd $1
    git init
    cd ..
}

# first commit だけしたリポジトリを作る
first_commit(){
    repo_init $1
    cd $1
    dd if=/dev/zero of=dummy.txt bs=100 count=1
    git add dummy.txt
    git commit -m "commit"
    cd ..
}

# 指定回数だけ commit したリポジトリを作る
some_commit(){
    first_commit $1
    cd $1
    for i in $(seq $2)
    do
	echo -n "a" >> dummy.txt
	git commit -a -m "add 1byte"
    done
    cd ..
}

repo_init init

first_commit first_commit

for i in $(seq 10)
do
    some_commit commit$i $i
done
