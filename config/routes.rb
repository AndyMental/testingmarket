Rails.application.routes.draw do
  
  namespace :admin do
    root :to => 'market_orgs#index'
    resources :market_orgs
  end
  resources :vendors, only: [:index, :show]
  resources :products, only: [:index, :show]

  get 'pages/index'
  get 'about', to: 'pages#about', as: 'about'
  get 'contact', to: 'pages#contact', as: 'contact'
  get 'terms', to: 'pages#tandc', as: 'tandc'
  get 'policy', to: 'pages#policy', as: 'policy'
  get 'cart', to: 'carts#index', as: 'cart'
  
  get 'carts/cart_items'
  get 'carts/catalog_item_info'
  get 'carts/delete'  
  get 'carts/update'

  post 'carts/add_items'

  resources :sessions, only: [:new, :create, :destroy]
  
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'register', to: 'sessions#register', as: 'register'
  get 'pssword_recovery', to: 'sessions#recovery', as: 'recovery'
  get 'change_password', to: 'sessions#account', as: 'account'
  post 'sessions/send_registration_request'
  post 'sessions/send_recovery_request'
  post 'sessions/send_password_change_request'

  root :to => "pages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
