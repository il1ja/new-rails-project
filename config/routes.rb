Rails.application.routes.draw do

  get 'users/new'
  resources :wikis do
    collection do
      get '/user_wikis', to: 'wikis#user_wikis', as: :user
    end
  end

  resources :users, only: [:new, :create]
  resources :charges_controller, only: [:new, :create]

  get 'home/index'
  devise_for :users
  devise_for :models
  root to: "home#index"
  root to: 'wikis#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
