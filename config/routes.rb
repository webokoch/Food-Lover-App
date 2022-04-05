Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/search", to: 'pages#search'
  resources :foods do
    resources :food_reviews, only: [ :new, :create ]
  end
  resources :restaurants
  get "/users_foods", to: 'foods#users_foods'
  get "/users_restaurants", to: 'restaurants#users_restaurants'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
