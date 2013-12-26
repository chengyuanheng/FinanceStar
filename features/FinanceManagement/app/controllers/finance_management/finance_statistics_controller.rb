require_dependency "finance_management/application_controller"

module FinanceManagement
  class FinanceStatisticsController < ApplicationController

    def index

      @customer_consume = CustomerConsume.find_all_by_user_id(current_user_id)

    end

  end
end
