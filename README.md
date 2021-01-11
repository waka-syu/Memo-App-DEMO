# memo-app-17110

# テーブル設計

## users テーブル

| Column   | Type    | Options                  |
| -------- | ------- | ------------------------ |
| name     | string  | null: false              |
| email    | string  | null: false unique: true |
| password | string  | null: false              |

### Association

- has_many :memos
- has_many :comments

## memos テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| content     | text       | null: false                    |
| genre_id    | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| content     | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| memo        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :memo
