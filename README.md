# Papeterie-station
https://papeterie-station-7e4731a83553.herokuapp.com/

## 概要
<img width="1227" alt="スクリーンショット 2023-10-04 3 39 49" src="https://github.com/Tamada-Arino/Papeterie-station/assets/129414368/6132696e-d95e-48ae-93c6-739188ded17c">
ユーザー同士で好きな文房具を共有するサイトです。
文房具の製品名や参考価格、画像や説明文を載せて共有できます。
また、レスポンシブ対応しているのでスマホからもご利用いただけます。

## 使用技術
* Ruby 2.7.8
* Ruby on Rails 6.1.7
* PostgreSQL
* RSpec
* AWS(S3)
* Omniauth
* 楽天商品検索API

## ER図
![Papeterie_station ER 図 (カラスの足記法) (3) (1)](https://github.com/Tamada-Arino/Papeterie-station/assets/129414368/c09ae6d5-e071-4078-81b0-b68857bd5db4)

## 機能一覧
- ユーザー登録、ログイン機能（devise）
ゲストログイン機能も実装しています。
また、googleアカウントを利用してのサインアップおよびログインにも対応しています。

* 検索機能（ransack）
<img width="1593" alt="スクリーンショット 2023-10-13 20 31 53" src="https://github.com/Tamada-Arino/Papeterie-station/assets/129414368/cd4d675f-e590-41d9-875e-7820a923e5fe">
キーワード検索で製品名と説明文、価格帯を対象に検索できます。製品名と価格、投稿日時によるソート機能も実装しています。

- カテゴリー機能（awesome_nested_set）
<img width="1584" alt="スクリーンショット 2023-10-13 20 34 52" src="https://github.com/Tamada-Arino/Papeterie-station/assets/129414368/19220653-0a67-41bb-ac41-31e6bc3e4032">
大カテゴリーと小カテゴリーを設定しており、大カテゴリーで探すとその子孫の小カテゴリーに属する製品も一覧で確認できます。
また、カテゴリーページでキーワードや価格帯で検索するとそのカテゴリー内で検索ができます。

- 製品投稿機能
<img width="791" alt="スクリーンショット 2023-10-04 3 55 41" src="https://github.com/Tamada-Arino/Papeterie-station/assets/129414368/a4470b96-352d-4181-8052-5ff59e756957">

- 検索機能（楽天）
<img width="1337" alt="スクリーンショット 2023-10-11 1 00 25" src="https://github.com/Tamada-Arino/Papeterie-station/assets/129414368/28343e20-299c-4860-a3e4-1438a5640d34">
投稿の詳細ページから、その製品名で検索して出てくる商品ページに遷移できるようになっています。

- いいね機能
投稿詳細ページからいいねができます。
いいねした投稿には一覧でもいいねしたことがわかるデザインにしています。
また、ユーザーページからそのユーザーがいいねした投稿の一覧を確認できます。

- フォロー機能
- コメント機能
