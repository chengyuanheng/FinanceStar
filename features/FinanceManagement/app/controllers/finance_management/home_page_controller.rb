require_dependency "finance_management/application_controller"

module FinanceManagement
  class HomePageController < ApplicationController

    def index
      @original_statistics = {}
      customers = Customer.where(user_id:current_user_id)

      customers.each_with_index do |customer, index|
        @original_statistics.merge!({
                               :"customer_#{index}" => {
                                   :head => "#{customer.name}的财务统计",
                                   :pie_tips => "支出总额/收入总额",
                                   :id => "customer_#{index}",
                                   :bind_data => init_customer_data(customer, current_user_id).to_json
                               }
                           })
      end
      @original_statistics
    end

    private

    def init_customer_data customer, user_id
      total_income = CustomerConsume.where(user_id:user_id, customer_name:customer.name, consume:"收入").pluck(:consume_value).reduce(0){|sum, i| sum + i}
      total_expenses = CustomerConsume.where(user_id:user_id, customer_name:customer.name, consume:"支出").pluck(:consume_value).reduce(0){|sum, i| sum + i}
      [{:label=>"支出",:data=>200},{:label=>total_expenses,:data=>total_income}]
    end
  end
end
