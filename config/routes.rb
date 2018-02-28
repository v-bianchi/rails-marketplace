Rails.application.routes.draw do

  devise_for :users
  root to: 'products#index'

  resources :products do
    resources :reviews, only: [:new, :create]
  end

  resources :requests, only: [:index, :new, :create]

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
