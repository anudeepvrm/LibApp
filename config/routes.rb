Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :bookedrooms
  resources :rooms
  root to: 'main#index'
  resources :users
  resources :admins

  get '/user_login', to: 'users#login'
  match '/validatelogin' => 'users#validatelogin', :as => :validate_user, via: :post
  match '/userhome' => 'users#home', :as => :user_home, via: :get
  match '/useredit' => 'users#edit', :as => :user_edit, via: :get
  match '/userlogout' => 'users#logout', :as => :user_logout, via: :get
  match '/searchrooms' => 'rooms#search_rooms', :as => :search_rooms, via: :get
  match '/search_result' => 'rooms#get_search_rooms', :as => :search_result, via: :post
  match '/getroomlist' => 'rooms#get_room_list', :as => :get_room_list, via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end