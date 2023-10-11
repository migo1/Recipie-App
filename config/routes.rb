Rails.application.routes.draw do
  resources :recipes
  resources :foods do 
    resources :recipes_foods, only: [:new, :create]
  end
  # devise_for :users
  devise_for :users, sign_out_via: [:get, :delete]

  # Defines the root path route ("/")
  root "home#index"
end
