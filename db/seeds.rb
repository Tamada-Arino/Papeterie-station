# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

root_category = Category.create(name: "筆記用具", parent_id: nil)
Category.create(name: "万年筆", parent_id: root_category.id)
Category.create(name: "ボールペン", parent_id: root_category.id)
Category.create(name: "シャープペンシル", parent_id: root_category.id)
Category.create(name: "えんぴつ", parent_id: root_category.id)
Category.create(name: "マーカー・サインペン", parent_id: root_category.id)
Category.create(name: "筆・筆ペン", parent_id: root_category.id)
Category.create(name: "修正液・修正テープ", parent_id: root_category.id)
Category.create(name: "消しゴム", parent_id: root_category.id)
Category.create(name: "その他", parent_id: root_category.id)

Category.create(name: "ノート・紙製品", parent_id: nil)
Category.create(name: "ペンケース", parent_id: nil)

root_category = Category.create(name: "手帳", parent_id: nil)
Category.create(name: "一般", parent_id: root_category.id)
Category.create(name: "システム手帳", parent_id: root_category.id)
Category.create(name: "手帳カバー", parent_id: root_category.id)
Category.create(name: "その他", parent_id: root_category.id)

Category.create(name: "ファイリング用品", parent_id: nil)

root_category = Category.create(name: "切断用品", parent_id: nil)
Category.create(name: "はさみ", parent_id: root_category.id)
Category.create(name: "カッターナイフ", parent_id: root_category.id)
Category.create(name: "ペーパーナイフ", parent_id: root_category.id)
Category.create(name: "その他", parent_id: root_category.id)

Category.create(name: "その他", parent_id: nil)
