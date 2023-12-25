require "rails_helper"

RSpec.describe Favorite, type: :model do
  describe "いいねの登録" do
    it "user_idとproduct_idが存在するときいいねの登録ができること" do
      favorite = build(:favorite)
      expect(favorite).to be_valid
    end

    it "user_idがないときいいねの登録ができないこと" do
      favorite = build(:favorite, user_id: "")
      expect(favorite).not_to be_valid
    end

    it "product_idが存在しないときいいねの登録ができないこと" do
      favorite = build(:favorite, product_id: "")
      expect(favorite).not_to be_valid
    end

    context "一意性の確認" do
      before do
        @favorite = build(:favorite)
      end

      it "ユーザーが同じ製品にいいねできないこと" do
        @favorite.save

        another_favorite = build(:favorite, user: @favorite.user, product: @favorite.product)
        expect(another_favorite).not_to be_valid
      end
    end
  end
end
