require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe 'フォロー登録' do
    it 'follower_idとfollowed_idがあれば登録できること' do
      relationship = build(:relationship)
      expect(relationship).to be_valid
    end
  end
end
