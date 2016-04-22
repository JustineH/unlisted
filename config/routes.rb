Rails.application.routes.draw do

  devise_for :users
  root to: 'welcome#index'
  resources :listings do
    collection do
      get :search
    end
  end

end
