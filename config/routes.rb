Rails.application.routes.draw do
  root "top#index"
  resources :users, only: [:edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :skills
  get 'skills/new/:category' => 'skills#new'
  get 'javascript/packs/main.js', to: 'javascript#main'
end
