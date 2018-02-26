Rails.application.routes.draw do
  get 'reviews/new'

  get 'reviews/create'

  devise_for :users
  root to: 'pages#home'

  resources :products do
    resources :reviews, only: [:new, :create]
  end

  resources :requests, only: [:index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
