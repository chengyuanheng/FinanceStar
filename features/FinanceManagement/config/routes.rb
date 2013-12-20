FinanceManagement::Engine.routes.draw do

  resources :home_page

  get "index", to:"home_page#index"

  get "customer_management/index" ,to:"customer_management#index"

  post "add_new_customer" , to: "customer_management#add_new_customer"

  post "edit_customer" , to:"customer_management#edit_customer"

  match "delete_customer/:id" ,to:"customer_management#delete_customer" , :via=>:post


  get "home_page/index" ,to:"home_page#index"

  get "my_finance/index" ,to:"my_finance#index"

  post "add_new_income_type" , to: "my_finance#add_new_income_type"

  post "add_new_expenses_type" , to: "my_finance#add_new_expenses_type"

  get "finance_statistics/index" , to: "finance_statistics#index"



end
