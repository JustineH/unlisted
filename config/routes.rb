Rails.application.routes.draw do

  devise_for :users

  root to: 'welcome#index'

  resources :listings do
    post :add_bookmark 
    delete :del_bookmark 
    get :basic
  end
  resources :images
  resources :vendors
  resources :charts

end
