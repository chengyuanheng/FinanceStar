# encoding: utf-8
require_dependency "finance_management/application_controller"
require "will_paginate/array"

module FinanceManagement
  class MyFinanceController < ApplicationController

    def index

      @customers = Customer.find_all_by_user_id(current_user_id)

      @customer_consume = UserDefinedConsumeType.find_all_by_user_id(current_user_id)

      @my_finance = CustomerConsume.find_all_by_user_id(current_user_id).reverse.paginate(:page => params[:page], :per_page => 10)

      @all_customer = CustomerConsume.where(user_id:current_user_id).group(:customer_name)

    end

    def save_consume_table

      customer_consume_table = CustomerConsume.new
      customer_consume_table.user_id = current_user_id
      customer_consume_table.customer_name = params[:select_customer]
      customer_consume_table.consume = params[:select_customer_consume]
      customer_consume_table.consume_type = params[:customer_consume_type]
      customer_consume_table.consume_value = params[:customer_consume_value]
      customer_consume_table.consume_describe = params[:customer_consume_describe]
      customer_consume_table.save

      redirect_to :action => 'index'
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

    def customer_income_detail

      customer_name = params[:name]

      @customer_consume = UserDefinedConsumeType.find_all_by_user_id(current_user_id)

      @my_finance = CustomerConsume.where(user_id:current_user_id).where(customer_name:customer_name).where(consume:"收入").reverse.paginate(:page => params[:page], :per_page => 10)

      @all_customer = CustomerConsume.where(user_id:current_user_id).group(:customer_name)

    end

    def customer_expense_detail

      customer_name = params[:name]

      @customer_consume = UserDefinedConsumeType.find_all_by_user_id(current_user_id)

      @my_finance = CustomerConsume.where(user_id:current_user_id).where(customer_name:customer_name).where(consume:"支出").reverse.paginate(:page => params[:page], :per_page => 10)

      @all_customer = CustomerConsume.where(user_id:current_user_id).group(:customer_name)

    end

  end
end
