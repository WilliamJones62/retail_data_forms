Rails.application.routes.draw do
  devise_for :users
  resources :onspecials
  resources :dontcalls
  get 'altcsrs/list'
  get 'altcsrs/selected'
  get 'altcsrs/multi'
  resources :altcsrs
  get 'home/show'

  get 'calllists/list'
  get 'calllists/selected'
  get 'calllists/routelist'
  get 'calllists/routeselected'
  get 'calllists/customerlist'
  get 'calllists/customerselected'
  get 'calllists/not_called'
  get 'calllists/not_ordered'
  resources :calllists do
    collection { post :import }
  end
  get 'authorlists/selected'
  resources :authorlists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#show'
end
