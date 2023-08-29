class Product < ApplicationRecord
  has_many_attached :images
  
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
end
