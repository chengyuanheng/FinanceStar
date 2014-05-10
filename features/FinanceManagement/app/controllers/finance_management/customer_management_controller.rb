require_dependency "finance_management/application_controller"
require "will_paginate/array"

module FinanceManagement
  class CustomerManagementController < ApplicationController

    def index
      @customers = Customer.where(user_id:current_user_id).paginate(:page => params[:page], :per_page => 10)
    end


    def add_new_customer
      customer = Customer.new
      customer.user_id = current_user_id
      customer.name = params[:new_customer][:name]
      customer.phone = params[:new_customer][:phone]
      customer.email = params[:new_customer][:email]
      customer.original_funds = params[:new_customer][:original_funds]
      customer.save

      respond_to do |format|
        if customer.save
          flash[:create_new_customer] = "success"
          format.html { redirect_to :action => 'index', notice: 'User was successfully created.' }
        else
          flash[:create_new_customer] = "failed"
          format.html { redirect_to :action => 'index', notice: 'User was failed created.' }
        end
      end
    end

    def edit_customer
      customer = Customer.find_by(phone:params[:edit_customer][:phone])
      customer.name = params[:edit_customer][:name]
      customer.email = params[:edit_customer][:email]
      customer.original_funds = params[:edit_customer][:original_funds]
      customer.save

      redirect_to :action => 'index'
    end

    def delete_customer
      customer = Customer.find_by(id:params[:id])
      customer.delete

      redirect_to :action => 'index'
    end
  end
end
