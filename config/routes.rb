Rails.application.routes.draw do

root to: "static_pages#index"

  resources :skate_maps,        only: [:index, :show]
  resources :skate_spots,       only: [:index, :show]
  resources :user_skate_spots,  only: [:new, :index, :show, :create, :approve, :deny]

  get "/home",                   to: "static_pages#index"
  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure",            to: redirect('/')
  get "/signout",                to: "sessions#destroy"


  namespace :administrator do
    resources :admins
    resources :users
    resources :skate_spots
    resources :user_skate_spots do
      member do
        post 'approval'
        post 'denial'
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :skate_spots,      only: [:index, :show]
      resources :user_skate_spots, only: [:index, :show]
    end
  end

end
