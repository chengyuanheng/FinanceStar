FinanceStarUsers::Engine.routes.draw do
  resources :users
  resources :sessions

  root :to => 'sessions#new'
  get "/signin" => 'sessions#new'
  get "/signout" => 'sessions#destroy'
  match "/signup" => 'register#new', :via => :get, :as => 'signup'
  match "/signup" => 'register#create', :via => :post

end
