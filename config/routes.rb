Rails.application.routes.draw do
  # get 'shopping_lists/show'
  get 'shopping_list', to: 'shopping_lists#show'
    get 'public_recipes', to: 'recipes#public_recipes'

  resources :recipes do
    member do
      patch :toggle
    end
    resources :recipes_foods, only: [:new, :create]
  end
  resources :foods 
  # devise_for :users
  devise_for :users, sign_out_via: [:get, :delete]

  # Defines the root path route ("/")
  root "home#index"
end
