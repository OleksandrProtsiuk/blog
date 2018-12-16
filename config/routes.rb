Rails.application.routes.draw do
  default_url_options :host => '0.0.0.0:3000'
  root 'static_pages#home', as: 'home'

  get 'static_pages/contacts', as: 'contacts'
  get 'static_pages/help', as: 'help'

  # get 'sessions/new'

  get 'signup', to: 'users#new', as: 'signup'
  get 'sign_up', to: 'users#check', as: 'sign_up'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get '/tagged', to: 'posts#tagged', as: :tagged

  resources :users
  resources :sessions
  resources :posts
  resources :account_activations

  resources :posts do
    resources :comments, as: 'comments'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
