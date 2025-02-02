class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create]

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
  end

  def sign_up_params
    params.require(:registration).permit(:email, :password, :password_confirmation)
  rescue ActionController::ParameterMissing
    params.permit(:email, :password, :password_confirmation)
  end
end
