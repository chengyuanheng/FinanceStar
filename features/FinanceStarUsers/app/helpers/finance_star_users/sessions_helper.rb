#encoding=UTF-8

module FinanceStarUsers
  module SessionsHelper

    def sign_in(user)
      session[:user_id] = user.id
    end

    def signed_in?
      !current_user.nil?
    end

    def sign_out
      session[:user_id] = nil
    end

    def current_user
      if session[:user_id].nil?
        return nil
      else
        User.find(session[:user_id])
      end
    end

    def current_user_id
      session[:user_id] || nil
    end

    def is_admin?
      signed_in? && current_user.admin
    end

    def deny_access
      redirect_to '/signin', :notice => "Please sign in to access this page."
    end

    def non_admin_authenticate
      deny_access unless signed_in? && (not current_user.admin)
    end

    def admin_authenticate
      deny_access unless is_admin?
    end

  end
end
