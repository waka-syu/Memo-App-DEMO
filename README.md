# Memo-App-DEMO

# アプリケーション概要

- ユーザー登録をすることでメモを作成することができます。作成したメモはいつでもマイページにて確認ができます。
- ユーザーが作成したメモはログインしていなくても閲覧することができます。
- 投稿している他ユーザが作成したメモに対して、ログインユーザーならお気に入り登録することができます。
- 投稿してあるメモに対して、ログインユーザーならコメントをすることができます。

# URL

## https://memo-app-demo-17110.herokuapp.com/

# Basic認証・テスト用アカウント

## Basic認証

### ID：admin、 Password：17110

## テスト用アカウント

### E-mailアドレス：test@gmail.com、password：t12345

# 利用方法

# 目指した課題解決

- 学生・社会人など学習を行っている人がメモを作成して、いつでもすぐにメモを確認できるようにすることです。
- 他のユーザーが作成したメモを見ることで、同じ悩みや疑問をすぐに解決できるようにすることです。

# Memo-App-DEMOの要件定義

| 実装したい機能     | 要件                                                     |
| --------------- | -------------------------------------------------------- |
| ユーザー管理機能   | ・ユーザーを新しく登録できる                                  |
|                 | ・ユーザー登録が完了している場合、ログインすることができる         |
|                 | ・ログアウトできる                                          |
| メモ投稿機能      | ・ログインしている場合、メモを新しく投稿できる                   |
|                 | ・投稿されているメモは他ユーザー、未ログインユーザーでも閲覧できる   |
| お気に入り機能    | ・ログインしている場合、気に入ったメモをお気に入り登録できる        |
| コメント機能      | ・ログインしている場合、メモに対してコメントを投稿できる           |
| 検索機能         | ・投稿されているメモから、ジャンルかキーワードでメモを探せる        |
| グループ機能      | ・メモ共有を行う場であるグループを作成できる                     |
|                 | ・ユーザーがグループ名を決定できる                             |
|                 | ・グループに招待するユーザーを選択できる                        |

# 実装した機能について

## ユーザー管理機能

- ユーザーの新規登録ができます。
- https://gyazo.com/0f4818d1817e234e5e3612d90deff6ab

- 登録後ログイン・ログアウトができます。
- https://gyazo.com/bb13bc918bcd6f8939496406f6947b04
- https://gyazo.com/50981ba407ee706bed302bfed4ddf4ae

## メモ投稿機能

- 新規メモ作成ページにてメモを作成できます。
- https://gyazo.com/37ad185edb3a890f3e10f5ce59ef35ce

## お気に入り登録機能

- 気に入ったメモをお気に入り登録できます。
- https://gyazo.com/65cdf32ddcce87c837cb7cfc7a149bd7

## コメント機能

- 投稿されているメモにコメントすることができます。
- https://gyazo.com/ddb7a98d815865c0b7749761eb648118

## 検索機能

- 投稿されているメモをジャンル検索することができます。
- https://gyazo.com/56ab96d36c82db3d2c6d8da09c5ef5d4

# 実装予定の機能

- 検索機能のキーワード検索ができるようにしたいと考えております。
- グループ機能を実装したいと考えております。

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
- has_many :favorites

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
- has_many :favorites

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| content     | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| memo        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :memo

## favorites テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| memo        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :memo

# ローカルでの動作方法

## git clone後、Basic認証を設定している為、下記の内容を実行してください。

### macOSがMojave以前の方

- ターミナル上で $ vim ~/.bash_profile と記入して.bash_profileを開いたら、「i」とタイプしてインサートモードに移行してください。
- .bash_profileの内部に次のように記述を追加してください。 export BASIC_AUTH_USER='admin' ・ export BASIC_AUTH_PASSWORD='17110'
- 記述を追加したら、escキーを押してインサートモードを抜け、 「:wq」と入力して保存して終了します。
- ターミナル上で $ source ~/.bash_profile と記入して .bash_profileを再読み込みし、定義した環境変数を有効にします。

### macOSがCatalina以降の方

- ターミナル上で % vim ~/.zshrc と記入して.zshrcを開いたら、「i」とタイプしてインサートモードに移行してください。
- .zshrcの内部に次ように記述を追加してください。 export BASIC_AUTH_USER='admin' ・ export BASIC_AUTH_PASSWORD='17110'
- 記述を追加したら、escキーを押してインサートモードを抜け、 「:wq」と入力して保存して終了します。
- ターミナル上で % source ~/.zshrc と記入して .zshrcを再読み込みし、定義した環境変数を有効にします。

## 開発環境

### Mac OS 10.14.6

### Ruby 2.6.5p114

### Rails 6.0.0