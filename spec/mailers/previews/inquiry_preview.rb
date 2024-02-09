# Preview all emails at http://localhost:3000/rails/mailers/inquiry
class InquiryPreview < ActionMailer::Preview
  def inquiry
    inquiry = Inquiry.new(name: "テスト", address: "test@sample.com", text: "問い合わせメッセージ")

    InquiryMailer.send_mail(inquiry)
  end
end
