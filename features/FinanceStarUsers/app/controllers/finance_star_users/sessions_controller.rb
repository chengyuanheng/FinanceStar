require_dependency "finance_star_users/application_controller"

module FinanceStarUsers
  class SessionsController < ApplicationController

    def new

      #redirect_by_role current_user if singin_in?

    end


    def redirect_by_role current_user

      if is_admin?
        redirect_to '/'
      else
        redirect_to '/'
      end

    end

  end
end
