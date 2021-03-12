# Q.4 Mystery of Permission

Git は、ファイルの内容だけでなく様々なものをバージョン管理しています。
例えばファイルパーミッションのようなメタデータも Git は管理してくれます。
やってみましょう。

次のように、ファイルパーミッションが 600 のファイルと 700 のファイルを作成しコミットしました。

```
$ touch 600.txt 700.txt 
$ chmod 600 600.txt
$ chmod 700 700.txt
$ git add 600.txt 700.txt
$ git commit -m "add 600.txt 700.txt"
```

その後、600.txt と 700.txt を一度削除して、 git checkout で復元します

```
$ rm 600.txt 700.txt
$ git checkout HEAD 600.txt 700.txt
```

このとき、 600.txt と 700.txt のファイルパーミッションとして正しいものを選んでください。

1. 600.txt -> 600, 700.txt -> 700
2. 600.txt -> 666, 700.txt -> 777
3. 600.txt -> 644, 700.txt -> 755
4. 環境による
