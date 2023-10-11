Rails.application.routes.draw do
  # get 'shopping_lists/show'
  get 'shopping_list', to: 'shopping_lists#show'
  resources :recipes do
    member do
      patch :toggle
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
