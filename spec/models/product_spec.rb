require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '製品情報の登録' do
    it "name、description、price、user_idとcategory_idが存在すれば登録できること" do
      product = build(:product)
      expect(product).to be_valid
    end

    it "nameがなければ登録できないこと" do
      product = build(:product, name: "")
      expect(product).not_to be_valid
    end

    it "priceがなければ登録できないこと" do
      product = build(:product, price: "")
      expect(product).not_to be_valid
    end

    it "priceが負の数字であれば登録できないこと" do
      product = build(:product, price: -1)
      expect(product).not_to be_valid
    end

    it "descriptionがなくても登録できること" do
      product = build(:product, description: "")
      expect(product).to be_valid
    end

    it "user_idがなければ登録できないこと" do
      product = build(:product, user_id: "")
      expect(product).not_to be_valid
    end

    it "category_idがなくても登録できること" do
      product = build(:product, category_id: "")
      expect(product).to be_valid
    end
  end
end
