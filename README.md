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

# 利用方法
## ルーム作成
1. トップページでユーザー新規登録を行う
2. サイドバーのNweボタンから、ルームの内容（日付、名前、ルームパス）を入力し作成する
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
妻にヒアリングし、「結婚式の参列者が撮った写真を共有できない」という課題があることが判明した。課題を分析した結果、「写真を共有するための参列者共通の場がない」ということが真因であると仮説を立てた。同様の問題を抱えていえる方も多いと推測し、真因を解決するために、参列者だけが写真を共有できるアプリケーションを開発することにした。

# 洗い出し要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1nS95MlNuByA_dbfTBppADF_hLU6pTOrbvHlERQ9gWho/edit#gid=982722306)

# 実装した機能についての画像やGIFおよびその説明
## 投稿一覧表示
- ルームに参加すると投稿された写真が一覧表示されます。

[![Image from Gyazo](https://i.gyazo.com/5d1d33c2b06626a43dfd5924cb2c7c91.jpg)](https://gyazo.com/5d1d33c2b06626a43dfd5924cb2c7c91)

## ルーム作成機能
- ルームの内容を入力しルームを新規作成します。

[![Image from Gyazo](https://i.gyazo.com/31b0b9fe17f02c169133e31aad613194.png)](https://gyazo.com/31b0b9fe17f02c169133e31aad613194)

## 投稿機能
- 投稿ボタンから写真を投稿できます。
- 写真は複数投稿できます

[![Image from Gyazo](https://i.gyazo.com/c226626ecae3d7fffab13a8e3442718c.gif)](https://gyazo.com/c226626ecae3d7fffab13a8e3442718c)

## お気に入り登録・ダウンロード機能
- 詳細ページからお気に入り登録および画像のダウンロードができます

[![Image from Gyazo](https://i.gyazo.com/2ee095ec2d3eea94746aa12522533864.gif)](https://gyazo.com/2ee095ec2d3eea94746aa12522533864)

# 実装予定の機能
現在、レスポンシブ対応にするための実装中。
今後はお気に入り登録した画像の一括ダウンロード機能を実施予定。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/1d3cf576e01465dceccf4927f5097681.png)](https://gyazo.com/1d3cf576e01465dceccf4927f5097681)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/b8ffaf1e887bb2c6e3e6ab93da240f76.png)](https://gyazo.com/b8ffaf1e887bb2c6e3e6ab93da240f76)
<!-- # テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :posts
- has_many :rooms, through: :user_rooms
- has_many :favorites

## rooms テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| name      | string  | null: false |
| room_path | string  | null: false |
| host_id   | integer | null: false |

### Association

- has_many :user, through: :user_rooms

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user


## posts テーブル

| Colum      | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| room       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room
- has_many :favorites

## favorites テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user -->