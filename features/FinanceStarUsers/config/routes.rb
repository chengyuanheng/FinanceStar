FinanceStarUsers::Engine.routes.draw do

  resources :users

  resources :sessions

  root :to => 'sessions#new'

  get "/signin" => 'sessions#new'

  get "/signout" => 'sessions#destroy'

  match "/signup" => 'register#new', :via => :get, :as => 'signup'

  match "/signup" => 'register#create', :via => :post

  get "/bulk_sms" => "send_sms#index"

  post 'sms_need_send' => 'send_sms#fetch_sms_need_send'

  post "/bulk_sms" => "send_sms#save_bulk_sms"

  get "/setting/info" => "setting#info"

  post '/confirm_origin_password' => "setting#confirm_origin_password"

  post '/update_password' => 'setting#update_password'

end
