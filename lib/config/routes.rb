Rails.application.routes.draw do
  resources :onspecials
  resources :dontcalls
  resources :altcsrs
  get 'home/show'

  get 'calllists/list'
  get 'calllists/called_update'
  get 'calllists/ordered_update'
  get 'calllists/route'
  get 'calllists/not_called'
  get 'calllists/not_ordered'
  resources :calllists do
    collection { post :import }
  end
  resources :authorlists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#show'
end
