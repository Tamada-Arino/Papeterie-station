class Product < ApplicationRecord
  has_many_attached :images
  
  belongs_to :user
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
 end
end
