# encoding: utf-8
require_dependency "finance_management/application_controller"

module FinanceManagement
  class MyFinanceController < ApplicationController

    def index

      @consume = UserDefinedConsumeType.find_all_by_user_id(current_user_id)



    end

    def add_new_expenses_type

      consume = UserDefinedConsumeType.new
      consume.user_id = current_user_id
      consume.consume = "支出"
      consume.consume_type = params[:new_expenses_type][:expenses_type]
      consume.save

      redirect_to :action => 'index'


    end

    def add_new_income_type

      consume = UserDefinedConsumeType.new
      consume.user_id = current_user_id
      consume.consume = "收入"
      consume.consume_type = params[:new_income_type][:income_type]
      consume.save

      redirect_to :action => 'index'

    end




  end
end
