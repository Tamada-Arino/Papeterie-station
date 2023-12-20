require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  describe "問い合わせ内容送信" do
    it "name、addressとtextが存在すれば送信できること" do
      inquiry = build(:inquiry)
      expect(inquiry).to be_valid
    end

    it "nameがなければ送信できないこと" do
      inquiry = build(:inquiry, name: "")
      expect(inquiry).not_to be_valid
    end

    it "textがなければ送信できないこと" do
      inquiry = build(:inquiry, text: "")
      expect(inquiry).not_to be_valid
    end

    it "addressがなくても送信できること" do
      inquiry = build(:inquiry, address: "")
      expect(inquiry).to be_valid
    end

    it "addressがメールアドレスではない文字列だと送信できないこと" do
      inquiry = build(:inquiry, address: "test")
      expect(inquiry).not_to be_valid
    end
  end
end
