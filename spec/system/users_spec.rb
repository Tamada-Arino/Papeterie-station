require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  it 'メールアドレスを変更できること' do
    visit edit_user_registration_path

    fill_in 'Eメール', with: 'new_email@example.com'
    fill_in '現在のパスワード', with: user.password

    click_button '更新'

    expect(page).to have_content('アカウント情報を変更しました。')
  end

  it '名前とプロフィールを変更できること' do
    visit users_profile_path

    fill_in '名前', with: 'new_name'
    fill_in 'プロフィール', with: 'new_profile'

    click_button '更新'

    expect(page).to have_content('プロフィールが更新されました。')
  end
end
