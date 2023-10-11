Rails.application.routes.draw do
  resources :recipes do
    member do
      patch :toggle
      get :generate_shopping_list
    end
  end
  resources :foods do 
    resources :recipes_foods, only: [:new, :create]
  end
  # devise_for :users
  devise_for :users, sign_out_via: [:get, :delete]

  # Defines the root path route ("/")
  root "home#index"
end
