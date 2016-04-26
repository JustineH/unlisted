Rails.application.routes.draw do

  devise_for :users

  root to: 'welcome#index'

#   resources :listings do
#     get :add_bookmark
#     collection do
#       get :search
#     end
#   end

  resources :listings do
    get :add_bookmark 
    get :basic
  end
  resources :images
  resources :vendors




end
