Unlisted::Application.routes.draw do

  get 'home/index'

  get 'home/foundation'

  root "home#index"
end
