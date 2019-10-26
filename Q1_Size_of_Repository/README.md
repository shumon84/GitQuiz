Git リポジトリのサイズは、管理されているファイルが分かっていれば、ある程度見積もることができるのをご存知ですか？
この問題では、実際に Git リポジトリのサイズを見積もってもらいます。

まず次のコマンドで 100 B のファイルを 1 つだけ持つ Git リポジトリを作成します。

```
$ mkdir repo && cd repo && git init           # Git リポジトリを作成
$ dd if=/dev/zero of=dummy.txt bs=100 count=1 # 100 B のファイル dummy.txt を作る
$ git add dummy.txt && git commit -m "commit" # コミットする
```

その後、次のコマンドを10回繰り返します。

```
$ echo -n a >> dummy.txt       # dummy.txt の末尾に 1 B 追加
$ git commit -a -m "add 1byte" # コミットする
```

最終的に次のようなリポジトリが出来上がりました。

```
$ git log --oneline
7a0691b add 1byte
f1178c1 add 1byte
0ce355e add 1byte
dfa8313 add 1byte
1d9750c add 1byte
a1cc5cc add 1byte
8b5ef44 add 1byte
f3586dd add 1byte
e509c8d add 1byte
989c89f add 1byte
30515df commit
```

さて、ここで次のヒントが与えられます。
- git init 時のサイズは 19,317 バイト(約 19.3 KB)
- first commit 時のサイズは 20,109 バイト(約 20.1 KB)

この瞬間の repo/ のサイズに最も近いのは、次のうちどれでしょう。

1. 約 21 KB
2. 約 25 KB
3. 約 28 KB
4. 約 31 KB
