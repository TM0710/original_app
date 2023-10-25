# アプリケーション名
MyWedding

# アプリケーション概要
写真を共有し、気に入った写真をダウンロードできる

# URL
https://original-app-tq6c.onrender.com

# テスト用アカウント
- Basic認証パスワード：admin
- Basic認証ID：2222
- メールアドレス：test@test.com
- パスワード：12345a
- Room_Key：test2

# 利用方法
## ルーム作成
1. トップページでユーザー新規登録を行う
2. サイドバーのNewボタンから、ルームの内容（日付、名前、ルームキー）を入力し作成する
## 写真投稿
1. サイドバーのフォームにルームパスを入力しルームに参加、または自分でルームを作成する
2. Postボタンから、画像を入力し投稿する
## お気に入り登録
 1. 一覧ページから画像を選択し詳細ページに遷移
 2. ハートマークを押しお気に入り登録する
## 写真ダウンロード
 1. 一覧ページから画像を選択し詳細ページに遷移
 2. Downloadボタンから画像をダウンロード

# アプリケーションを作成した背景
妻にヒアリングし、「結婚式で参列者が撮った写真を共有できない」という課題があることが判明した。課題を分析した結果、「写真を共有するための参列者共通の場がない」ということが真因であると仮説を立てた。同様の問題を抱えていえる方も多いと推測し、真因を解決するために、参列者だけが写真を共有できるアプリケーションを開発することにした。

# 洗い出し要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1nS95MlNuByA_dbfTBppADF_hLU6pTOrbvHlERQ9gWho/edit#gid=982722306)

# 実装した機能についての画像やGIFおよびその説明
## 投稿一覧表示
- ルームに参加すると投稿された画像が一覧表示される。

[![Image from Gyazo](https://i.gyazo.com/ec48c2d172625362ea347b4b1780ad75.jpg)](https://gyazo.com/ec48c2d172625362ea347b4b1780ad75)

## ルーム作成機能
- ルームの内容を入力しルームを新規作成する。

[![Image from Gyazo](https://i.gyazo.com/022f87f95b437da9681dd59b9466f688.png)](https://gyazo.com/022f87f95b437da9681dd59b9466f688)

## ルーム参加機能
- Room＿Keyを入力しルームに参加できる。

## 投稿機能
- 投稿ボタンから画像を投稿できる。
- 画像は複数投稿できる。

[![Image from Gyazo](https://i.gyazo.com/c226626ecae3d7fffab13a8e3442718c.gif)](https://gyazo.com/c226626ecae3d7fffab13a8e3442718c)

## お気に入り登録・ダウンロード機能
- 詳細ページからお気に入り登録および画像のダウンロードができる。

[![Image from Gyazo](https://i.gyazo.com/2ee095ec2d3eea94746aa12522533864.gif)](https://gyazo.com/2ee095ec2d3eea94746aa12522533864)

# 実装予定の機能
現在、レスポンシブ対応にするための実装中。
今後はお気に入り登録した画像の一括ダウンロード機能を実施予定。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/946e7d113700ab469c4d35cc18620199.png)](https://gyazo.com/946e7d113700ab469c4d35cc18620199)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/b8ffaf1e887bb2c6e3e6ab93da240f76.png)](https://gyazo.com/b8ffaf1e887bb2c6e3e6ab93da240f76)

# 開発環境
- フロントエンド
- バックエンド
- テキストエディタ
- タスク管理

# ローカルでの動作方法
以下のコマンドを順に実行。  
% git clone https://github.com/TM0710/original_app.git  
% cd original_app  
% bundle install  
% yarn install

# 工夫したポイント
- 投稿のハードルを下げるために、投稿は写真のみ、匿名性にした。