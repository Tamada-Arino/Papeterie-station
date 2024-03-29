class Product < ApplicationRecord
  FILE_NUMBER_LIMIT = 3

  belongs_to :user
  belongs_to :category, optional: true
  has_many_attached :images
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validate :validate_number_of_files
  validates :images,
content_type: { in: [:png, :jpg, :jpeg], message: "はpng, jpg, jpegいずれかの形式にして下さい" }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name", "description", "price"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end

  scope :related_to_category, ->(category_id, current_product_id) do
    where(category_id: category_id)
      .where.not(id: current_product_id)
      .order(created_at: :desc)
  end

  private

  def validate_number_of_files
    return if images.length <= FILE_NUMBER_LIMIT
    errors.add(:images, "に添付できる画像は#{FILE_NUMBER_LIMIT}枚までです。")
  end
end
