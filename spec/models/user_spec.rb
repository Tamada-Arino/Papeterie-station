require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録' do
    it "name、email、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nameがなければ登録できないこと" do
      user = build(:user, name: "")
      expect(user).not_to be_valid
    end

    it "emailがなければ登録できないこと" do
      user = build(:user, email: "")
      expect(user).not_to be_valid
    end

    it "passwordがなければ登録できないこと" do
      user = build(:user, password: "")
      expect(user).not_to be_valid
    end

    it "password_confirmationがなければ登録できないこと" do
      user = build(:user, password_confirmation: "")
      expect(user).not_to be_valid
    end

    it "passwordとpassword_confirmationが不一致だと登録できないこと" do
      user = build(:user, password_confirmation: "222222")
      expect(user).not_to be_valid
    end

    it "passwordとpassword_confirmationが6文字未満だと登録できないこと" do
      user = build(:user, password: "11111", password_confirmation: "11111")
      expect(user).not_to be_valid
    end
  end
end
