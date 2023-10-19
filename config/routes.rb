Rails.application.routes.draw do
  
  devise_for :users
  root to: "homes#top"
  resources :books, only: [:new, :index, :show, :create, :destroy]
  resources :users, only: [:index, :show, :edit, :create]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end