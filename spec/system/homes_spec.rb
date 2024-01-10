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
    end
  end
end
