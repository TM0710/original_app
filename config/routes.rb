Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :rooms, only: [:new, :create, :destroy] do
    resources :posts, only: [:index, :new, :create, :show, :destroy]
    collection do
      get 'search'
    end
  end
end
