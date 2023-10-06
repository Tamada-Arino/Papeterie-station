require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "ユーザー登録" do
    it "user_id、product_idとcontentが存在すれば登録できること" do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it "contentがなければ登録できないこと" do
      comment = build(:comment, content: "")
      expect(comment).not_to be_valid
    end

    it '150文字のコメントは投稿できること' do
      comment = build(:comment, content: 'a' * 150)
      expect(comment).to be_valid
    end

    it '151文字を超えるコメントは投稿できないこと' do
      comment = build(:comment, content: 'a' * 151)
      expect(comment).not_to be_valid
    end

    it "user_idがなければ登録できないこと" do
      comment = build(:comment, user_id: "")
      expect(comment).not_to be_valid
    end

    it "product_idがなければ登録できないこと" do
      comment = build(:comment, product_id: "")
      expect(comment).not_to be_valid
    end
  end
end
