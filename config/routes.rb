Rails.application.routes.draw do
  get 'welcome/index'

  get 'vendors/index'


  get 'users/index'

  get 'users/new'

  get 'users/edit'

  get 'users/show'

  

  get 'listings/index'

  get 'listings/show'

  get 'listings/new'

  get 'listings/edit'

  # resources :listings


  root 'welcome#index'
end
