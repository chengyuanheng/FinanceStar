# encoding: utf-8
require_dependency "finance_management/application_controller"

module FinanceManagement
  class MyFinanceController < ApplicationController

    def index

      @customers = Customer.find_all_by_user_id(current_user_id)

      @customer_consume = UserDefinedConsumeType.find_all_by_user_id(current_user_id).paginate(:page => params[:page], :per_page => 10)
      @my_finance = CustomerConsume.find_all_by_user_id(current_user_id).paginate(:page => params[:page], :per_page => 10)







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

      customer_consume = UserDefinedConsumeType.new
      customer_consume.user_id = current_user_id
      customer_consume.consume = "收入"
      customer_consume.consume_type = params[:new_income_type][:income_type]
      customer_consume.save

      redirect_to :action => 'index'

    end

    def edit_customer_consume

      customer_consume = UserDefinedConsumeType.find_by(id: params[:edit_customer_consume]["consume_id"])
      customer_consume.consume_type = params[:edit_customer_consume]["consume_type"]
      customer_consume.save

      redirect_to :action => 'index'

    end

    def delete_customer_consume

      customer_consume = UserDefinedConsumeType.find_by(id:params[:id])
      customer_consume.delete

      redirect_to :action => 'index'

    end




  end
end
