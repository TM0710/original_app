# テーブル設計

## users テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| username               | string | null: false |
| email                  | string | null: false |
| encrypted_password     | string | null: false |

### Association

- has_many :posts
- has_many :favorites, through: :user_favorites

## posts テーブル

| Colum      | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| favorite   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :favorites

## favorites テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post   | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- has_many :users, through: :user_favorites