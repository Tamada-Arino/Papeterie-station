![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/Tamada-Arino/Papeterie-station)
![GitHub repo size](https://img.shields.io/github/repo-size/Tamada-Arino/Papeterie-station)
![GitHub language count](https://img.shields.io/github/languages/count/Tamada-Arino/Papeterie-station)
![GitHub top language](https://img.shields.io/github/languages/top/Tamada-Arino/Papeterie-station)

# Papeterie　Station
https://papeterie-station-7e4731a83553.herokuapp.com/

## 概要

<img width="1470" alt="スクリーンショット 2024-01-10 20 33 36" src="https://github.com/Tamada-Arino/Papeterie-station/assets/129414368/8faf70ab-119c-4f58-ae91-9a01da6b4ba0">

Papeterie Station（パペトゥリーステーション）はユーザー同士で好きな文房具を共有するサイトです。
文房具の製品名や参考価格、画像や説明文を載せて他の共有できます。
また、レスポンシブ対応しているのでスマホからもご利用いただけます。

## 開発背景

私はスキルアップのため、日々様々な資格勉強に取り組んでいます。
勉強を続ける上でのモチベーション維持のために文房具にこだわりを持っており、SNSを通じて私のお気に入りの文房具を発信したい、また文房具好きのユーザーのおすすめの文具を紹介する記事を見て実際に買ったり使ったりしたいという思いから開発に着手しました。

## 使用技術

  ### フロントエンド
  * HTML
  * CSS
  * JavaScript
  * Bootstrap
  
  ### バックエンド
  * Ruby 2.7.8
  * Ruby on Rails 6.1.7
  * PostgreSQL

  ### インフラ
  * Heroku
  * AWS(S3)

  ### テストフレームワーク
  * RSpec
  
  ### その他
  * Git
  * Rubocop
  * Mailgun
  * Omniauth
  * 楽天商品検索API

## ER図

  ![Papeterie_station ER 図 (カラスの足記法) (3) (1)](https://github.com/Tamada-Arino/Papeterie-station/assets/129414368/c09ae6d5-e071-4078-81b0-b68857bd5db4)

## インフラ構成図

  ![名称未設定 drawio (1)](https://github.com/Tamada-Arino/Papeterie-station/assets/129414368/482761f9-31cf-4d75-9cd1-4e457f4d9cce)

## 機能一覧

  * ユーザー認証機能(devise)
  * 投稿機能(CRUD処理)
    - 画像投稿機能
  * 検索機能(ransack)
    - ソート機能
  * カテゴリー機能(awesome_nested_set)
  * 商品表示機能(楽天API)
  * いいね機能
  * フォロー機能
  * コメント機能
  * メール送信機能（Mailgun)

  ### ユーザー認証機能（devise）

  * ユーザー登録
  * ログイン
  * ログアウト
  * ゲストログイン
  * Googleアカウントでのログイン・登録
  * パスワードの再設定

  以上の機能を用意しています。
  
  ### 投稿機能（CRUD処理）

  <img width="791" alt="スクリーンショット 2023-10-04 3 55 41" src="https://github.com/Tamada-Arino/Papeterie-station/assets/129414368/a4470b96-352d-4181-8052-5ff59e756957">

  気に入った文房具に対しての投稿が可能です。

  * 投稿の作成
  * 内容の変更
  * 投稿の削除

  以上の機能を実装しています。詳細ページ内にはカテゴリーページへのリンクや楽天市場へのリンクがあり、いいね機能やコメント機能を利用できます。

  また、画像を添付しての投稿も可能です。画像が複数の場合カルーセルで一枚づつ表示されるようにしています。不正なファイルや大容量のファイルが読み込まれないよう、active_storage_validationsジェムを利用して拡張子とファイルサイズを指定しています。
  
  ### 検索機能（ransack）

　　　<img width="1470" alt="スクリーンショット 2024-01-10 20 34 07" src="https://github.com/Tamada-Arino/Papeterie-station/assets/129414368/d044d1f1-dc84-4787-bbb4-74c2c0642b22">
  
  キーワード検索で製品名と説明文、価格帯を対象に検索できます。価格帯の検索に関しては下限価格と上限価格が逆転しないようJavaScriptで制御しています。

  また、ransackを利用したソート機能を実装しています。対象は製品名、価格で、一度クリックすると昇順、もう一度クリックすると光順で表示されるようになります。

  ### カテゴリー機能（awesome_nested_set）
  
      
  投稿にはカテゴリーを紐づけることができ、紐づけた場合、該当カテゴリーの投稿一覧で表示されるようになります。また、カテゴリーには大カテゴリーと小カテゴリーを設定しており、大カテゴリーで探すとその子孫の小カテゴリーに属する製品も一覧で確認できます。
  カテゴリーページでキーワードや価格帯で検索するとそのカテゴリー内での検索が可能です。

  ### 楽天市場の商品表示機能

  <img width="1337" alt="スクリーンショット 2023-10-11 1 00 25" src="https://github.com/Tamada-Arino/Papeterie-station/assets/129414368/28343e20-299c-4860-a3e4-1438a5640d34">
  ユーザビリティ向上のため、楽天の商品検索APIを使用しています。投稿の詳細ページから、その製品名で検索して出てくる商品ページに遷移可能です。

  ### いいね機能
    
  投稿詳細ページからいいねができます。
  いいねした投稿には一覧でもいいねしたことがわかるデザインにしています。
  また、ユーザーページからそのユーザーがいいねした投稿の一覧を確認できます。

  ### フォロー機能

  <img width="1243" alt="スクリーンショット 2023-12-25 23 08 59" src="https://github.com/Tamada-Arino/Papeterie-station/assets/129414368/0b7b66f7-e2c1-4329-b74f-75af5ca706f3">
  ユーザーページからユーザーをフォローすることができます。
  フォローしたユーザーの新規投稿はトップページから確認可能です。

  ### コメント機能
  商品記事にコメントをつけられます。

  ### メール送信機能(Mailgun)
  フッターのリンクからご意見・問い合わせを送信可能です。送信された内容は開発者宛にメールで送られます。

## テスト

  * RSpec
    - 単体テスト(Model)
    - 統合テスト(System)

## 今後実装したいもの

  * 閲覧履歴の記録機能
  * Google以外の外部アカウントを利用した認証機能
  * 投稿本文のリッチテキスト化
