Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :rooms, only: [:new, :create, :destroy] do
    resources :posts, only: [:index, :new, :create] do
      member do
        get 'show_image/:index', to: 'posts#show_image', as: 'show_image'
        get 'show_video/:index', to: 'posts#show_video', as: 'show_video'
        delete 'show_image/:index/image', to: 'posts#destroy_image', as: 'destroy_image'
        delete 'show_video/:index/video', to: 'posts#destroy_video', as: 'destroy_video'
        post 'show_image/:index/favorites', to: 'favorites#create', as: 'add_favorite'
        delete 'show_image/:index/favorites', to: 'favorites#destroy', as: 'remove_favorite'
      end
    end
    member do
      delete 'exit'
    end
    collection do
      get 'search'
    end
  end
  resources :users, only: :show do
    get '/download_favorites.zip', to: 'favorites#download_all', as: 'download_favorites'
    resources :favorites, only: :index
  end
end
