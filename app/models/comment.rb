class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :content, presence: true
  validates :content, length: { maximum: 150 }  
end
