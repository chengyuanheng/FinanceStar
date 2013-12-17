FinanceManagement::Engine.routes.draw do

  resources :home_page

  get "index", to:"home_page#index"

  get "customer_management/index" ,to:"customer_management#index"

  get "home_page/index" ,to:"home_page#index"

  get "my_finance/index" ,to:"my_finance#index"



end
