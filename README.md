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

## ER図
![Papeterie_station ER 図 (カラスの足記法)](https://github.com/Tamada-Arino/Papeterie-station/assets/129414368/58402393-6394-4f5b-9a63-1079a0b57cfe)

## 機能一覧
- ユーザー登録、ログイン機能（devise）
ゲストログイン機能も実装しています。

* 検索機能（ransack）
<img width="1234" alt="スクリーンショット 2023-10-04 4 06 47" src="https://github.com/Tamada-Arino/Papeterie-station/assets/129414368/cb26ffdb-afe2-4476-94c8-deebacbe740f">
キーワード検索で、製品名と説明文を対象に検索できます。

- カテゴリー機能（awesome_nested_set）
<img width="1233" alt="スクリーンショット 2023-10-04 4 02 00" src="https://github.com/Tamada-Arino/Papeterie-station/assets/129414368/ffc3322a-fadb-4cde-8af5-0865cb28d43b">
大カテゴリーと小カテゴリーを設定しており、大カテゴリーで探すとその子孫の小カテゴリーに属する製品も一覧で確認できます。
また、カテゴリーページでキーワード検索するとそのカテゴリー内で検索ができます。

- 製品投稿機能
<img width="791" alt="スクリーンショット 2023-10-04 3 55 41" src="https://github.com/Tamada-Arino/Papeterie-station/assets/129414368/a4470b96-352d-4181-8052-5ff59e756957">

- いいね機能
投稿詳細ページからいいねができます。
いいねした投稿には一覧でもいいねしたことがわかるデザインにしています。
また、ユーザーページからそのユーザーがいいねした投稿の一覧を確認できます。

- フォロー機能
- コメント機能
