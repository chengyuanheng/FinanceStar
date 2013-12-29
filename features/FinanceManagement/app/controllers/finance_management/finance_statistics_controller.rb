require_dependency "finance_management/application_controller"
require "will_paginate/array"

module FinanceManagement
  class FinanceStatisticsController < ApplicationController

    def index

      @customer_consume = CustomerConsume.where(user_id:current_user_id).group(:customer_name,:consume).having("created_at < ?", Time.now()).sum(:consume_value)

    end

    def show_customer_detail

      @name = params[:name]

      condition = {consume: params[:consume_classify], time: params[:time_classify]}

      @customer =  select_customer condition

      @the_customer_all_consume = CustomerConsume.where(user_id:current_user_id).where(customer_name:@name)

      @original_funds = Customer.find_by(name:@name).original_funds

      @income_total = @the_customer_all_consume.where(consume:"收入").sum(:consume_value)

      @expenses_total = @the_customer_all_consume.where(consume:"支出").sum(:consume_value)

      @surplus_finance = @original_funds + @income_total - @expenses_total

    end


    def select_customer condition

      consume_filter = {}
      time_filter = {}

      case condition[:consume]
        when "income"
          consume_filter  = { consume_switch: true ,
                              consume: "收入"
                           }
        when "expenses"
          consume_filter = { consume_switch: true ,
                             consume: "支出"
                          }
      end

      case condition[:time]
        when "week_summary"
          time_filter = { time_switch: true ,
                          time: "#{Time.now.beginning_of_week}"
                        }
        when "mouth_summary"
          time_filter = { time_switch: true ,
                           time: "#{Time.now.beginning_of_month}"
                        }
        when "quarterly_summary"
          time_filter = { time_switch: true ,
                          time: "#{Time.now.beginning_of_quarter}"
                        }
      end

      filter_hash = consume_filter.merge(time_filter)

      query = filter_sql filter_hash

      filter_customer query

    end



    def filter_sql filter_hash

      if filter_hash[:consume_switch]
        filter_sql_one = "and customer_consume.consume = '#{filter_hash[:consume]}'"
      else
        filter_sql_one = ""
      end

      if filter_hash[:time_switch]
        filter_sql_two = "and customer_consume.created_at >= '#{filter_hash[:time]}' and customer_consume.created_at <= '#{Time.now}' "
      else
        filter_sql_two = ""
      end

      return filter_sql_one + filter_sql_two

    end

    def filter_customer query

      fix_query_sql = "select * from finance_management_customer_consumes customer_consume where customer_consume.user_id = '#{current_user_id}' and customer_consume.customer_name = '#{params[:name]}'"

      CustomerConsume.find_by_sql("#{fix_query_sql} #{query}").paginate(:page => params[:page], :per_page => 10)

    end








  end
end
