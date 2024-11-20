Rails.application.routes.draw do
  devise_for :users

  # ホームページとaboutページのルーティング
  root to: 'homes#top'
  get 'home/about', to: 'homes#about', as: 'about'

  # リソースルーティング
  resources :books do
  resources :comments, only: [:create, :destroy]
  resource :favorite, only: [:create, :destroy]
end
    resources :users, only: [:index, :show, :edit, :update]
end