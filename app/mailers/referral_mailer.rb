class ReferralMailer < ApplicationMailer
  def send_referral(user, email)
    mail(to: email, from: user.email, subject: "You're invited to join our platform!")
  end
end
