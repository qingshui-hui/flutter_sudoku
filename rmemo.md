## install package
pubspec.yamlのdependenciesにパッケージ名を追加する。
バージョンの部分は空白でもよい。
そのあと
```
$ flutter pub get
```

## flutter commands
https://flutter.dev/docs/get-started/web
設定を確認
$ flutter config
ブラウザ、ウェブサーバーを確認
$ flutter devices

enable web support
$ flutter channel beta
$ flutter upgrade
$ flutter config --enable-web

error NoSuchMethodError: 'toFilePath'
$ flutter update-packages

## 自動フォーマット
配列の引数の末尾にカンマを入れるか入れないかで、ctrl+alt+Lの結果は変わる。
カンマを入れたほうが、jsonの整形と同じ形になりよい。

## reactivity
incrementで配列の0要素を変更したとき、Textも変更されたことから、
配列に対しても再レンダリングは効いているみたい。