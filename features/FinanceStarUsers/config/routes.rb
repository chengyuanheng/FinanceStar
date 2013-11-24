FinanceStarUsers::Engine.routes.draw do
  resources :users
  resources :sessions

  root :to => 'sessions#new'
  get "/signin" => 'sessions#new'
  get "/signout" => 'sessions#destroy'


end
