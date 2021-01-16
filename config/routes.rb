Rails.application.routes.draw do
  mount_devise_token_auth_for 'AdminUser', at: 'admin/auth'
  mount_devise_token_auth_for 'User', at: 'v1/auth'

  namespace :admin do
    resources :categories
  end

  as :user do
    namespace :v1 do
      resources :categories, only: [:index]
    end
  end
end
