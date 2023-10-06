require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe 'フォロー登録' do
    it 'follower_idとfollowed_idがあれば登録できること' do
      relationship = build(:relationship)
      expect(relationship).to be_valid
    end

    it 'follower_idがないとき登録できないこと' do
      relationship = build(:relationship, follower_id: "")
      expect(relationship).not_to be_valid
    end

    it 'followed_idがないとき登録できないこと' do
      relationship = build(:relationship, followed_id: "")
      expect(relationship).not_to be_valid
    end

    it 'ユーザーが自分自身をフォローできないこと' do
      user = create(:user)
      relationship = build(:relationship, follower: user, followed: user)
      expect(relationship).not_to be_valid
    end
    
    context '一意性の確認' do
      before do
        @follower = create(:user)
        @followed = create(:user, email: "test2@gmail.com")
        @relationship = build(:relationship, follower: @follower, followed: @followed)
      end
    
      it 'フォローする人とフォローされる人が同じレコードが登録されないこと' do
        @relationship.save
    
        another_relationship = build(:relationship, follower: @follower, followed: @followed)
        expect(another_relationship).not_to be_valid
      end
    end
  end
end
