class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  validates :name, presence: true
  validates :avatar, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg']}
end
