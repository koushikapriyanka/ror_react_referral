class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user_from_token!

  def send_referral
    email = params[:email]
    if @user.send_referral_email(email)
      render json: { message: "Referral email sent successfully!" }, status: :ok
    else
      render json: { message: "Failed to send referral email." }, status: :unprocessable_entity
    end
  end

   private

  def authenticate_user_from_token!
    uid = request.headers['uid']
    client = request.headers['client']
    access_token = request.headers['access-token']
    @user = User.find_by(uid: uid)

    if @user && @user.tokens[client] 
      stored_token = @user.tokens[client]['token']
      if BCrypt::Password.new(stored_token) == access_token
        sign_in @user, store: false
      end
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
