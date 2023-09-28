# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# カテゴリーの設定
root_categories = [
  {
    name: "筆記用具",
    children: [
      "万年筆", "ボールペン", "シャープペンシル",
      "えんぴつ", "マーカー・サインペン", "その他(筆記用具)"
    ]
  },
  {
    name: "ノート・紙製品",
    children: ["ノート", "手帳", "メモ帳・付箋", "その他(紙製品)"]
  },
  {
    name: "ペンケース",
    children: []
  },
  {
    name: "ファイリング用品",
    children: []
  },
  {
    name: "切る・貼る",
    children: [
      "はさみ", "カッターナイフ", "ペーパーナイフ",
      "ホッチキス", "のり・テープ", "その他(切る・貼る)"
    ]
  },
  {
    name: "その他",
    children: []
  }
]

root_categories.each do |root_category_data|
  root_category = Category.create(name: root_category_data[:name], parent_id: nil)

  root_category_data[:children].each do |child_name|
    Category.create(name: child_name, parent_id: root_category.id)
  end
end

# ユーザーの設定
users = [
  {name: 'Alice', email: 'user1@example.com', password: 'passw@rd'},
  {name: 'Bob', email: 'user2@example.com', password: 'passw@rd'},
  {name: 'Carol', email: 'user3@example.com', password: 'passw@rd'},
  {name: 'Dave', email: 'user4@example.com', password: 'passw@rd'},
  {name: 'Ellen', email: 'user5@example.com', password: 'passw@rd'},
]

users.each do |record|
  User.create!(record) unless User.find_by(email: record[:email])
end

# 投稿の設定
products_data = [
  {
    name: "キャップレス",
    price: 19800,
    description: "キャップのない万年筆です。ノックするとペン先が出てきます。",
    category_id: 2,
    user_id: 1
  },
  {
    name: "ライティブ",
    price: 2200,
    description: "スタイリッシュなデザインで、携帯性も高いです。お安めなので初めての万年筆におすすめです。",
    category_id: 2,
    user_id: 1
  },
  {
    name: "カクノ",
    price: 1100,
    description: "はじめての万年筆が、愛着のあるペンになる。シンプルで使いやすい万年筆、カクノ。初心者のための万年筆です。",
    category_id: 2,
    user_id: 2
  },
  {
    name: "ZOOM C1",
    price: 7700,
    description: "通常はボディと接合されているはずのノックボタンとボディの間には、非現実的ともいえる空間があり、なんとも不思議な浮遊感のあるデザインとなっています。",
    category_id: 3,
    user_id: 1
  },
  {
    name: "ZOOM L2",
    price: 3520,
    description: "ゆるやかな曲線を描くシルエットに、繊細なくびれが目を惹く逆円錐のノックボタンがデザインされたエレガントな印象を受けます。",
    category_id: 3,
    user_id: 1
  },
  {
    name: "クラフトラボ 002",
    price: 3520,
    description: "誰しもが懐かしさを感じる、サクラクレパスのベストセラー「クーピーペンシル」をイメージして作られボールペン。",
    category_id: 3,
    user_id: 3
  },
  {
    name: "ユニ アルファゲル スイッチ",
    price: 1100,
    description: "芯が回ることで細い文字を書き続けることができる「クルトガモード」と、芯を固定して安定した筆記ができる「ホールドモード」を使い分けられます。",
    category_id: 4,
    user_id: 2
  },
  {
    name: "デルガード タイプGR",
    price: 770,
    description: "筆圧をかけすぎても芯が折れないデルガードシステム。筆圧が強めの人でも疲れにくく、集中して書くことができます。",
    category_id: 4,
    user_id: 2
  },
  {
    name: "ドクターグリップ CL プレイバランス",
    price: 770,
    description: "ドクターグリップのグリップ内部の部品を、シリコンとメタルから選択することで、重量バランスを変えられます。",
    category_id: 4,
    user_id: 2
  },
  {
    name: "水彩グラファイト鉛筆",
    price: 1650,
    description: "世界最古の高級筆記具ブランドとして知られるファーバーカステル。書いた後に水を含ませると水彩表現のできる水性鉛筆もあるので、水彩画にもおすすめです。",
    category_id: 5,
    user_id: 1
  },
  {
    name: "大人の鉛筆",
    price: 562,
    description: "木材がこだわっていて、アメリカ産の高級なインセスシダーという木材を使用しており、とても綺麗な木目になっているのが特徴的で、どこか懐かしい気持ちをよみがえらせてくれます。",
    category_id: 5,
    user_id: 3
  },
  {
    name: "エアイン 富士山消しゴム",
    price: 220,
    description: "左右から使うと、消しゴムが富士山になります。消しゴムに求められる『よく消える』機能と、『消す楽しみ』を同時に実現する、新しい消しゴムです。",
    category_id: 7,
    user_id: 4
  },
  {
    name: "iroshizuku＜色彩雫＞",
    price: 1650,
    description: "色彩雫（いろしずく）は、日本の美しい情景、その美しい名から創造された彩り豊かな万年筆用インキです。たっぷり50mlサイズ。私は天色という色を愛用しています。",
    category_id: 7,
    user_id: 1
  },
  {
    name: "毎日使いたいガラスペン GROOM",
    price: 8250,
    description: "シンプルで美しいガラスペンです。安心感のある太い軸、持ち運べるコンパクトな長さが特徴で、持ち運びやすいです。",
    category_id: 7,
    user_id: 5
  }
]

products_data.each do |data|
  Product.create!(data)
end

# いいねの設定
favorites_data = [
  { user_id: 1, product_id: [3, 6, 14] },
  { user_id: 2, product_id: [1, 4] },
  { user_id: 3, product_id: [4, 11] },
  { user_id: 4, product_id: [4, 3] },
  { user_id: 5, product_id: [1, 2, 13] }
]

favorites_data.each do |data|
  user = User.find(data[:user_id])
  data[:product_id].each do |product_id|
    Favorite.create!(user: user, product_id: product_id)
  end
end

#コメントの設定
comments_data = [
  {
    content: "これは不思議なデザインだね。",
    user_id: 2,
    product_id: 4
  },
  {
    content: "そうなんです、このなんとも不思議なデザインに惚れて買ってしまいました！今では私のお気に入りです。",
    user_id: 1,
    product_id: 4
  },
  {
    content: "とてもスタイリッシュなボールペンだ！",
    user_id: 2,
    product_id: 5
  },
  {
    content: "ガラスペン、気になっているんですが使ってみてどうですか？",
    user_id: 1,
    product_id: 14
  },
  {
    content: "飽きのこない美しさです。実はインク持ちがいいのでハガキ一枚ぶんはインク付け直さなくてもいいんですよ。",
    user_id: 5,
    product_id: 14
  }
]

comments_data.each do |comment_data|
  Comment.create!(
    content: comment_data[:content],
    user_id: comment_data[:user_id],
    product_id: comment_data[:product_id]
  )
end

# フォロー関係の設定
follow_data = [
  { follower_id: 1, followed_id: [2, 3, 4] },
  { follower_id: 2, followed_id: [1, 5] },
  { follower_id: 3, followed_id: [1, 4] },
  { follower_id: 4, followed_id: [2, 3] },
  { follower_id: 5, followed_id: [1, 3, 4] }
]

follow_data.each do |data|
  follower = User.find(data[:follower_id])
  followed_users = User.where(id: data[:followed_id])

  followed_users.each do |followed_user|
    Relationship.create!(
      follower: follower,
      followed: followed_user
    )
  end
end
