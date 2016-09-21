Rails.application.routes.draw do

  root to: 'main#index'
  resources :users
  resources :admins

  get '/user_login', to: 'users#login'
  match '/validatelogin' => 'users#validatelogin', :as => :validate_user, via: :post
  match '/userhome' => 'users#home', :as => :user_home, via: :get
  match '/useredit' => 'users#edit', :as => :user_edit, via: :get
  match '/userlogout' => 'users#logout', :as => :user_logout, via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
