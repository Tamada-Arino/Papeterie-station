class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: "system@#{ENV['MAILGUN_DOMAIN']}",
      to: ENV['GMAIL_USERNAME'],
      subject: 'お問い合わせ通知'
    )
  end
end
