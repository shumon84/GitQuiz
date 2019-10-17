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

# 同じ時間に指定回数 commit する
make_commit(){
    for i in $(seq $1)
    do
	echo -n "a" >> dummy.txt
	git add dummy.txt
	sudo systemsetup -settime 11:00:00 # Mac の日時設定を変更
	git commit -m "add 1byte"
    done
}

sudo systemsetup -setusingnetworktime off

first_commit repo
cd repo
git branch develop
make_commit 4
git checkout develop
make_commit 4
cd ..

sudo systemsetup -setusingnetworktime on
