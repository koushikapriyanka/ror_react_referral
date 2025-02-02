class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  def create
    super
  end

  private

  def sign_in_params
    params.require(:session).permit(:email, :password)
  end
end
