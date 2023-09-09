class Product < ApplicationRecord
  FILE_NUMBER_LIMIT = 3
  
  belongs_to :user
  belongs_to :product
  has_many_attached :images
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
  validate :validate_number_of_files

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  private
  def validate_number_of_files
    return if images.length <= FILE_NUMBER_LIMIT
    errors.add(:images, "に添付できる画像は#{FILE_NUMBER_LIMIT}枚までです。")
  end
end
