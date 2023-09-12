# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

root_categories = [
  {
    name: "筆記用具",
    children: [
      "万年筆", "ボールペン", "シャープペンシル",
      "えんぴつ", "マーカー・サインペン", "筆・筆ペン",
      "修正液・修正テープ", "消しゴム", "その他(筆記用具)"
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
