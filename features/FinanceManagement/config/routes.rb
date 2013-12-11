FinanceManagement::Engine.routes.draw do

  resources :home_pages

  get "index", to:"home_pages#index"

end
