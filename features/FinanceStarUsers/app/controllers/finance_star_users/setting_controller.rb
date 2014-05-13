require_dependency "finance_star_users/application_controller"

module FinanceStarUsers
  class SettingController < ApplicationController

    def info
      @user = User.find(current_user_id)

      @customer_count = FinanceManagement::Customer.where(user_id:current_user_id).count || 0

      @income_total = FinanceManagement::CustomerConsume.where(user_id:current_user_id, consume:'收入').sum(:consume_value) || 0

      @expenses_total = FinanceManagement::CustomerConsume.where(user_id:current_user_id, consume:'支出').sum(:consume_value) || 0
    end

    def confirm_origin_password
      @user = User.find(current_user_id)

      render text: (@user.password == params['password'] ? 'password_right' : 'password_wrong')
    end

    def update_password

      @user = User.find(current_user_id)

      return render text: 'update_failed' if @user.password != params['origin_password']

      @user.update_attribute('password', params['password'])

      return render text:'update_success'

    end
  end
end
