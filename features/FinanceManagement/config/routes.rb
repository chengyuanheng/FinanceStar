FinanceManagement::Engine.routes.draw do

  resources :home_page

  get "index", to:"home_page#index"

  get "home_page/index" ,to:"home_page#index"

  get "customer_management/index" ,to:"customer_management#index"

  post "add_new_customer" , to: "customer_management#add_new_customer"

  post "edit_customer" , to:"customer_management#edit_customer"

  match "delete_customer/:id" ,to:"customer_management#delete_customer" , :via=>:post


  post "edit_customer_consume" , to:"my_finance#edit_customer_consume"

  match "delete_customer_consume/:id" ,to:"my_finance#delete_customer_consume" , :via=>:post

  get "my_finance/index" ,to:"my_finance#index"

  get "my_finance/income/:name" , to: "my_finance#customer_income_detail"

  get "my_finance/expense/:name" , to: "my_finance#customer_expense_detail"

  match "my_finance/save_consume_table",to:"my_finance#save_consume_table" ,:via => :post

  post "add_new_income_type" , to: "my_finance#add_new_income_type"

  post "add_new_expenses_type" , to: "my_finance#add_new_expenses_type"


  get "finance_statistics/index" , to: "finance_statistics#index"

  get "finance_statistics/show_customer_detail/:name" ,to: "finance_statistics#show_customer_detail"

end
