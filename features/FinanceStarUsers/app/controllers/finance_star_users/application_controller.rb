module FinanceStarUsers
  class ApplicationController < FinanceStarUsers.BaseControllerClass
    include SessionsHelper
    helper 'finance_star_users/sessions'
  end
end
