require "finance_star_users/engine"

module FinanceStarUsers

  mattr_accessor :BaseControllerClass

end

FinanceStarUsers.BaseControllerClass = ActionController::Base
