Rails.application.routes.draw do
  mount_devise_token_auth_for 'AdminUser', at: 'admin/auth'
  mount_devise_token_auth_for 'User', at: 'v1/auth'

  namespace :admin do
    resources :categories
    resources :pictograms
    resources :routines
  end

  namespace :v1 do
    resources :categories, only: [:index]
    resources :pictograms, only: [:index]
    resources :routines, only: [:index, :show]

    resource :folder, only: [:show, :update]
    resources :custom_categories
    resources :custom_pictograms
  end
end
