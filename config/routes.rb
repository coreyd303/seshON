Rails.application.routes.draw do

root to: "static_pages#index"

  resources :skate_maps
  resources :skate_spots
  resources :user_skate_spots

  get "/home",                   to: "static_pages#index"
  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure",            to: redirect('/')
  get "signout",                 to: "sessions#destroy"

end
