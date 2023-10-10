require "rails_helper"

RSpec.describe User, type: :model do
  describe "ユーザー登録" do
    it "name、email、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nameがなければ登録できないこと" do
      user = build(:user, name: "")
      expect(user).not_to be_valid
    end

    it '50文字の名前は登録できること' do
      user = build(:user, name: 'a' * 50)
      expect(user).to be_valid
    end

    it '51文字以上の名前は登録できないこと' do
      user = build(:user, name: 'a' * 51)
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

    context "一意性の確認" do
      before do
        @user = build(:user)
      end

      it "emailがすでに登録されていると登録できないこと" do
        @user.save

        another_user = build(:user)
        another_user.valid?
        expect(another_user.errors[:email]).to include("はすでに存在します")
      end
    end
  end
end
