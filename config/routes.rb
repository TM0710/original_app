Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :rooms, only: [:new, :create, :destroy] do
    resources :posts, only: [:index, :new, :create, :destroy] do
      member do
        get 'show_image/:index', to: 'posts#show_image', as: 'show_image'
        post 'show_image/:index/favorites', to: 'favorites#create', as: 'add_favorite'
        delete 'show_image/:index/favorites', to: 'favorites#destroy', as: 'remove_favorite'
      end
    end
    collection do
      get 'search'
    end
  end
  resources :users, only: :show do
    resources :favorites, only: :index
  end
end
