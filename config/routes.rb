Rails.application.routes.draw do
  resources :categories
  devise_for :users
  resources :tasks
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'home/about'
  root 'categories#index' 
end
