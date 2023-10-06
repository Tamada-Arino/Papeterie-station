require 'rails_helper'

RSpec.describe "Products", type: :system do
  describe "製品詳細ページ" do
    let(:category) { create(:category) }
    let(:product) { create(:product, category_id: category.id) }
    let(:related_products) { create_list(:product, 4, user_id: product.user.id, category_id: category.id) }

    before do
      visit product_path(product.id)
    end

    it "製品の名前、説明文、価格を取得できること" do
      expect(page).to have_content(product.name)
      expect(page).to have_content(product.description)
      expect(page).to have_content(product.price.to_s)
    end

    it "カテゴリーのリンクからそのカテゴリーページに遷移できること" do
      click_link(product.category.name)
      expect(current_path).to eq category_path(product.category.id)
    end

    it "関連商品の情報を表示していること" do
      related_products.all? do |related_product|
        expect(page).to have_content(related_product.name)
        expect(page).to have_content(related_product.price.to_s)
      end
    end
  end

  describe "製品情報編集ページ" do
    let(:user) { create(:user) }
    let(:another_user) { create(:user, email: "another@email.com") }
    let(:product) { create(:product, user_id: user.id) }

    before do
      sign_in user
    end

    it "製品情報を更新できること" do
      visit edit_product_path(product.id)
      fill_in '製品名', with: 'new_name'
      fill_in '参考価格', with: 2
      click_button '編集を完了する'
      expect(page).to have_content('投稿を変更しました')
    end

    it "製品情報を削除できること" do
      visit edit_product_path(product.id)
      click_button '投稿を削除'
      click_button '削除する'
      expect(page).to have_content('投稿を削除しました')
    end

    it "製品情報を登録したしたユーザー以外が製品情報の編集ページにアクセスできないこと" do
      sign_in another_user
      visit edit_product_path(product.id)
      expect(page).to have_content('アクセス権がありません')
    end
  end
end
