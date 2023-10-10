require 'rails_helper'

RSpec.describe "Comments", type: :system do
  describe "製品詳細ページ" do
    let(:user) { create(:user) }
    let(:product) { create(:product, user_id: user.id) }

    before do
      visit product_path(product.id)
    end

    context "未ログイン時" do
      it "コメント投稿ボタンを押すとログインページへ遷移すること" do
        click_button 'コメントを投稿'
        expect(current_path).to eq new_user_session_path
      end
    end

    context "ログイン時" do
      before do
        sign_in user
        fill_in 'コメント', with: 'comment'
        click_button 'コメントを投稿'
      end

      it "コメントが投稿できること" do
        expect(page).to have_content('comment')
      end

      it "コメント削除ボタンがあること" do
        expect(page).to have_button('削除')
      end

      it "コメント削除ボタンを押すとコメントが削除できること" do
        click_button '削除'
        expect(page).to have_content('コメントを削除しました')
      end
    end
  end
end
