class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :products
  has_many :favorites, dependent: :destroy

  validates :name, presence: true

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
  end

  def soft_delete  
    update_attribute(:deleted_at, Time.current)  
  end  

  def active_for_authentication?  
    super && !deleted_at  
  end  

  def inactive_message   
    !deleted_at ? super : :deleted_account  
  end  
end
