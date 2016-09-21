Rails.application.routes.draw do

  root to: 'main#index'
  resources :users
  resources :admins

  get '/user_login', to: 'users#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
