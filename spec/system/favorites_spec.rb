require 'rails_helper'

RSpec.describe "Favorites", type: :system do
  describe "製品詳細ページ" do
    let(:user) { create(:user) }
    let(:product) { create(:product, user_id: user.id) }

    before do
      visit product_path(product.id)
    end

    context "未ログイン時" do
      it "いいねボタンを押すとログインページへ遷移すること" do
        find(".favorite.text-secondary").click
        expect(current_path).to eq new_user_session_path
      end
    end

    context "ログイン時" do
      before do
        sign_in user
      end

      it "いいねされていない状態であること" do
        expect(page).to have_no_css('.favorite.text-red')
      end

      it "いいねボタンを押すといいねされること" do
        find(".favorite.text-secondary").click
        expect(page).to have_css('.favorite.text-red')
      end

      it "いいね済みでいいねをもう一度押すといいねが消えること" do
        find(".favorite.text-secondary").click
        find(".favorite.text-red").click
        expect(page).to have_css('.favorite.text-secondary')
      end
    end
  end
end
