Rails.application.routes.draw do
  get 'home/show'

  resources :calllists
  resources :authorlists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#show'
end
