# Tweet Archiver
MongoDB in ActionのTwitter APIとSinatraを使ったサンプルコード

## アプリ登録
[https://dev.twitter.com/](https://dev.twitter.com/) よりアプリ登録を行い、キーを取得する。  

## キーの指定
取得したキーをconfig.rbに設定する。

## ツイートのアーカイブ
update.rbを実行する。  
`$ ruby update.rb`

## アーカイブしたツイートの参照
viewer.rbを実行し、[http://localhost:4567](http://localhost:4567) にアクセスする。  
`$ ruby viewer.rb`
