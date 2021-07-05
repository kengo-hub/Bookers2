Rails.application.routes.draw do
  devise_for :users
  root to:'homes#top'

  resources :books do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  end
  get 'home/about', to:'homes#about'
  resources :users, only: [:show,:edit,:update,:index]
end
