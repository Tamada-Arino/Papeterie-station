require 'rails_helper'

RSpec.describe "Homes", type: :system do
  describe "トップページ" do
    let(:user) { create(:user) }

    context "未ログイン時" do
      before do
        visit root_path
      end

      it "ログインへのリンクがあること" do
        expect(page).to have_content('ログイン')
      end

      it "ログインへのリンクをクリックするとログインページへ遷移できること" do
        click_link 'ログイン'
        expect(current_path).to eq new_user_session_path
      end

      it "アカウント新規登録へのリンクがあること" do
        expect(page).to have_content('新規登録')
      end

      it "アカウント新規登録へのリンクをクリックすると新規登録ページへ遷移できること" do
        click_link '新規登録'
        expect(current_path).to eq new_user_registration_path
      end

      it "ゲストログインへのリンクがあること" do
        expect(page).to have_content('ゲストログイン')
      end

      it "ゲストログインへのリンクを押すとゲストログインできること" do
        click_link 'ゲストログイン'
        expect(page).to have_content('ゲストユーザーとしてログインしました。')
      end
    end

    context "ログイン時" do
      before do
        sign_in user
        visit root_path
      end

      it "ログイン、新規登録、ゲストログインのリンクがないこと" do
        expect(page).to have_no_content('ログイン')
        expect(page).to have_no_content('新規登録')
        expect(page).to have_no_content('ゲストログイン')
      end
    end
  end
end
