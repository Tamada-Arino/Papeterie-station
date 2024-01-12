require "rails_helper"

RSpec.describe "Users", type: :system do
  describe "ユーザー詳細ページ" do
    let(:user) { create(:user) }
    let(:another_user) { create(:user, email: "another@email.com") }

    before do
      sign_in user
      visit user_path(user.id)
    end

    it "ユーザーの名前とプロフィールが表示されていること" do
      expect(page).to have_content(user.name)
      expect(page).to have_content(user.introduction)
    end

    it "プロフィール編集ページへのリンクがあること" do
      expect(page).to have_content("編集")
    end

    it "投稿タブがアクティブであること" do
      expect(page).to have_css("a.nav-link.active", text: "投稿一覧")
    end

    it "お気に入り一覧タブが非アクティブであること" do
      expect(page).to have_no_css("a.nav-link.active", text: "お気に入り一覧")
    end

    it "お気に入り一覧タブをクリックするとお気に入りタブがアクティブになること" do
      click_link "お気に入り一覧"
      expect(page).to have_css("a.nav-link.active", text: "お気に入り一覧")
    end

    it "お気に入り一覧タブをクリックすると投稿一覧タブが非アクティブになること" do
      click_link "お気に入り一覧"
      expect(page).to have_no_css("a.nav-link.active", text: "投稿一覧")
    end

    context "他のユーザーとしてログイン時" do
      it "プロフィール編集ページへのリンクがないこと" do
        sign_in another_user
        visit user_path(user.id)
        expect(page).to have_no_content("編集")
      end
    end
  end

  describe "ユーザー情報の編集" do
    let(:user) { create(:user) }

    before do
      sign_in user
      visit edit_user_registration_path
    end

    it "メールアドレスを変更できること" do
      fill_in "Eメール", with: "new_email@example.com"
      fill_in "現在のパスワード", with: user.password
      click_button "更新"
      expect(page).to have_content("アカウント情報を変更しました。")
    end

    it "パスワードを変更できること" do
      fill_in "パスワード", with: "new_password"
      fill_in "パスワード（確認用）", with: "new_password"
      fill_in "現在のパスワード", with: user.password
      click_button "更新"
      expect(page).to have_content("アカウント情報を変更しました。")
    end

    it "アカウントを削除できること" do
      click_button "アカウント削除"
      click_button "削除する"
      expect(page).to have_content("アカウントを削除しました。またのご利用をお待ちしております。")
    end

    it "名前とプロフィールを変更できること" do
      visit users_profile_path
      fill_in "名前", with: "new_name"
      fill_in "プロフィール", with: "new_profile"
      click_button "更新"
      expect(page).to have_content("プロフィールが更新されました。")
    end
  end
end
