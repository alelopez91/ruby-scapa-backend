Rails.application.routes.draw do
  mount_devise_token_auth_for 'AdminUser', at: 'admin/auth'
  mount_devise_token_auth_for 'User', at: 'v1/auth'

  as :user do
    namespace :v1 do
      resources :categories, only: [:index]
    end
    # Define routes for User within this block.
  end

  namespace :admin do
    resources :categories, only: [:index, :show]
  end
end
