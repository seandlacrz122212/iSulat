Rails.application.routes.draw do
  resources :categories
  devise_for :users, :controllers => { registrations: 'users/registrations'}
  resources :tasks
  resources :users


  get "edit/category/:id/" => "categories#edit"

  get 'signup'  => 'users#new'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  
  get 'home/about'
  root 'categories#index' 
end
