Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :foods do
    resources :food_reviews, only: [ :new, :create ]
  end

  get "/users_foods", to: 'foods#users_foods'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
