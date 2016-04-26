Rails.application.routes.draw do

  devise_for :users

  root to: 'welcome#index'
  resources :listings do
    get :add_bookmark 
  end

end
