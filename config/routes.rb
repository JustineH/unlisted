Rails.application.routes.draw do

  devise_for :users

  root to: 'welcome#index'

  resources :listings do
    post :add_bookmark 
    delete :del_bookmark
    # resource :bookmark, only: [:create, :destroy]
  end




end
