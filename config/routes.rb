Rails.application.routes.draw do

  devise_for :users

  root to: 'welcome#index'
# <<<<<<< HEAD
#   resources :listings do
#     get :add_bookmark
#     collection do
#       get :search
#     end
#   end
# =======
  resources :listings do
    get :add_bookmark 
  end




end
