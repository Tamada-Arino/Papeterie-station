class Inquiry < ApplicationRecord
  validates :name, presence: true
  validates :text, presence: true
  validates :address, format: { with: URI::MailTo::EMAIL_REGEXP, message: "有効なメールアドレスを入力してください" }, allow_blank: true
end
