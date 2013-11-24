require_dependency "finance_star_users/application_controller"

module FinanceStarUsers
  class SessionsController < ApplicationController

    def new

      redirect_by_role current_user if signed_in?

    end


    def create
      user = User.authenticate(params[:session][:email], params[:session][:password])

      if user.nil?
        redirect_to signin_path
      else
        sign_in user
        redirect_by_role user
      end

    end







    private

    def redirect_by_role user

      p '11111111111111111111111'
      p users_path

      if user.admin?
        redirect_to users_path
      else
        #redirect_to FinanceStar.signin_redirect_path
      end

    end


  end
end
