Rails.application.routes.draw do
  root 'static_pages#home', as: 'home'

  get 'static_pages/contacts', as: 'contacts'
  get 'static_pages/help', as: 'help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
