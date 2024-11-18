Rails.application.routes.draw do
  devise_for :users

  # ホームページとaboutページのルーティング
  root to: 'homes#top'
  get 'home/about', to: 'homes#about', as: 'about'

  # リソースルーティング
  resources :books
  resources :users, only: [:index, :show, :edit, :update]
end