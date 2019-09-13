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
  get 'orders', to: 'pages#orders', as: 'orders'
  
  get 'order_details', to: 'pages#order_details', as: 'order_details'

  get 'checkout', to: 'checkouts#index', as: 'checkout'
  get 'payment', to: 'checkouts#payment', as: 'payment'
  get 'confirm', to: 'checkouts#confirm', as: 'confirm'
  get 'thankyou', to: 'checkouts#thankyou', as: 'thankyou'

  post 'checkouts/update_shipping_address'
  post 'checkouts/update_payment'
  post 'checkouts/confirm_checkout'

  get 'carts/cart_items'
  get 'carts/catalog_item_info'

  post 'carts/prod_crud'
  post 'carts/add_items'  
  post 'carts/update_item'
  post 'carts/reorder'
  
  get 'carts/delete_item'

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
