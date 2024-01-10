require "rails_helper"

RSpec.describe "Homes", type: :system do
  describe "トップページ" do
    let(:user) { create(:user) }

    context "未ログイン時" do
      before do
        visit root_path
      end

      it "アカウント新規登録へのリンクがあること" do
        expect(page).to have_content("ユーザー登録して投稿する")
      end

      it "アカウント新規登録へのリンクをクリックすると新規登録ページへ遷移できること" do
        click_link "ユーザー登録して投稿する"
        expect(current_path).to eq new_user_registration_path
      end
    end

    context "ログイン時" do
      before do
        sign_in user
        visit root_path
      end

      it "新規登録ページへのリンクがないこと" do
        expect(page).to have_no_content("ユーザー登録して投稿する")
      end

      it "投稿作成ページへのリンクがあること" do
        expect(page).to have_content("製品を投稿")
      end

      it "投稿作成ページのリンクをクリックすると該当ページへ遷移できること" do
        click_link "製品を投稿"
        expect(current_path).to eq new_product_path
      end

      it "お気に入り一覧へのリンクがあること" do
        expect(page).to have_content("お気に入り一覧")
      end

      it "お気に入り一覧へのリンクをクリックするとユーザーページへ遷移できること" do
        click_link "お気に入り一覧"
        expect(current_path).to eq user_path(user.id)
      end

      it "お気に入り一覧へのリンクをクリックすると遷移先でお気に入りタブがアクティブであること" do
        click_link "お気に入り一覧"
        expect(page).to have_css("a.nav-link.active", text: "お気に入り一覧")
      end
    end
  end
end
