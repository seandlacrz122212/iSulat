Rails.application.routes.draw do
  devise_for :users
  resources :tasks
  
  # get 'home/about'
  # root 'home#index'
  
  get 'home/about'
  root 'home#index' 
end
