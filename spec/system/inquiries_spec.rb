require "rails_helper"

RSpec.describe "Inquiries", type: :system do
  describe "問い合わせページ" do
    let(:inquiry) {create(:inquiry)}

    before do
      visit new_inquiry_path
    end

    it "問い合わせ内容を入力し確認画面へボタンを押すと確認画面へ移れること" do
      fill_in "お名前", with: inquiry.name
      fill_in "メールアドレス", with: inquiry.address
      fill_in "お問い合わせ内容", with: inquiry.text
      click_button "確認画面へ"
      expect(current_path).to eq confirm_inquiries_path
    end

    it "問い合わせ内容が送信できること" do
      fill_in "お名前", with: inquiry.name
      fill_in "メールアドレス", with: inquiry.address
      fill_in "お問い合わせ内容", with: inquiry.text
      click_button "確認画面へ"
      click_button "問い合わせ内容を送信する"
      expect(page).to have_content("問い合わせ内容を送信しました。")
    end
  end
end
