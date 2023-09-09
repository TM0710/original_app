Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :rooms, only: [:new, :create, :destroy] do
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
