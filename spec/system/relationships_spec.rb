require 'rails_helper'

RSpec.describe "Relationships", type: :system do
  describe "ユーザー詳細ページ" do
    let(:user) { create(:user) }
    let(:another_user) { create(:user, email: "another@email.com") }

    context "未ログイン時" do
      before do
        visit user_path(user.id)
      end

      it "フォローボタンがあること" do
        expect(page).to have_button('フォローする')
      end

      it "フォローボタンを押すとログインページに遷移すること" do
        click_button 'フォローする'
        expect(current_path).to eq new_user_session_path
      end  
    end

    context "ログイン時" do
      before do
        sign_in user
      end

      it "自分のユーザーページにフォローボタンがないこと" do
        visit user_path(user.id)
        expect(page).to have_no_button('フォローする')
      end

      it "他の人のページにフォローボタンがあること" do
        visit user_path(another_user.id)
        expect(page).to have_button('フォローする')
      end

      it "他の人のページのフォローボタンを押すとフォロー解除ボタンが出ること" do
        visit user_path(another_user.id)
        click_button 'フォローする'
        expect(page).to have_button('フォローを解除')
      end
    end
  end
end
