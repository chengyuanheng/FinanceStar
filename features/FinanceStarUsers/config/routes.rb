FinanceStarUsers::Engine.routes.draw do
  resources :users
  resources :sessions

  root :to => 'sessions#new'


end
