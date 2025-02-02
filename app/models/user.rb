class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :trackable
  include DeviseTokenAuth::Concerns::User

  def send_referral_email(email)
    ReferralMailer.send_referral(self, email).deliver_now
  end
end
