require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '製品情報の登録' do
    it "name、description、price、user_idとcategory_idが存在すれば登録できること" do
      product = build(:product)
      expect(product).to be_valid
    end
  end
end
