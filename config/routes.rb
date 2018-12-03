Rails.application.routes.draw do
  get 'sessions/login'
  post 'sessions/login' => 'sessions#create', as: 'log_in'
  get 'sessions/logout', as: 'log_out'
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index', as: 'home'

  get 'about' => 'pages#about', as: 'about'

  get 'reg' => 'users#new'
  post 'users' => 'users#create'

  post 'sessions' => 'sessions#create'

  resources :posts do
    resources :comments
  end

end
