Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations',
        sessions: 'api/v1/auth/sessions'
      }
      post 'auth/sign_in', to: 'api/v1/auth/sessions#create'
      post 'send_referral', to: 'users#send_referral'
    end
  end
end
