Rails.application.routes.draw do

  devise_for :users

  root to: 'welcome#index'
  resources :listings 

  # get 'welcome/index'
  # get 'vendors/index'
  # get 'vendors/new'
  
  # get 'users/index'
  # get 'users/new'
  # get 'users/edit'
  # get 'users/show'

  # get 'listings/index'
  # get 'listings/show'
  # get 'listings/new'
  # get 'listings/edit'

  # resources :listings

  # root 'welcome#index'

end
