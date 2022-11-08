Rails.application.routes.draw do
  get 'users/show'
  get 'rooms/index'
  
  
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'pages#home'

  resources :interests 

  devise_for :users

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  get 'user/:id', to: 'users#show', as: 'user'

  resources :rooms do
    resources :messages
  end

  get 'pages/map', to: 'pages#map'
  

  get '/products/:id/smail', to:'products#smail', as: 'smail_product'

  get 'messages', to: 'static_pages#messages'
  get 'messages/open', to: 'messages#create'

  get '/account/', to: 'pages#account', as: 'show_current_account'
  get '/payments/success', to: 'payments#success', as: 'success_payment'
  get '/payments/failure', to: 'payments#failure', as: 'failure_payment'
  post '/payments/webhook', to: 'payments#webhook'
end

