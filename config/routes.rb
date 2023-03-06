Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'
  get "/home", to: 'pages#home'
  get "/search", to: 'pages#search'
  get "/map", to: 'pages#map'
  get "/food_info", to: 'pages#food_info'
  get "/restaurant_info", to: 'pages#restaurant_info'
  get "/map_info", to: 'pages#map_info'
  get "/about", to: 'pages#about'
  get "/api", to: 'pages#api'
  
  resources :foods do
    resources :food_reviews, only: [ :new, :create ]
    resources :food_restaurants, only: :create 
    resources :likes, only: :create
  end
  resources :restaurants do
    resources :restaurant_reviews, only: [ :new, :create ]
    resources :food_restaurants, only: :create 
  end
  
  get "/users_foods", to: 'foods#users_foods'
  get "/users_restaurants", to: 'restaurants#users_restaurants'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :foods, only: [ :index, :show ]
      resources :restaurants, only: [ :index, :show ]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
