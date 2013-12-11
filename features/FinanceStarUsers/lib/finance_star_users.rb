require "finance_star_users/engine"

module FinanceStarUsers

  mattr_accessor :BaseControllerClass
  mattr_accessor :signin_redirect_path

end

FinanceStarUsers.BaseControllerClass = ActionController::Base
