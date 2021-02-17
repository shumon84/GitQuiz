#!/bin/bash

# git init だけしたリポジトリを作る
repo_init(){
    rm -rf $1
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
	git commit -m "add 1byte"
    done
}

export GIT_COMMITTER_DATE="2020-01-01 10:11:22 +0900"
export GIT_AUTHOR_DATE="2021-01-01 10:11:22 +0900"

first_commit repo
cd repo
git branch develop
make_commit 4
git checkout develop
make_commit 4
cd ..

