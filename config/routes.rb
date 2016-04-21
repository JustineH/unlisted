Rails.application.routes.draw do


  devise_for :users
  get 'welcome/index'

  get 'vendors/index'

  get 'vendors/new'

  get 'users/index'

  get 'users/new'

  get 'users/edit'

  get 'users/show'

  get 'listings/index'

  get 'listings/show'

  get 'listings/new'

  get 'listings/edit'

  get 'listings/details' 

  get 'listings/amenities'

  get 'listings/photos'

  get 'listings/extra'

  get 'listings/basic'

  # resources :listings


  root 'welcome#index'
end
