Rails.application.routes.draw do
  root 'static_pages#home', as: 'home'

  get 'static_pages/contacts', as: 'contacts'
  get 'static_pages/help', as: 'help'

  get 'sessions/new'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
