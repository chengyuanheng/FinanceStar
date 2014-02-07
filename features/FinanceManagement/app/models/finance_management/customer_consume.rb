module FinanceManagement
  class CustomerConsume < ActiveRecord::Base
    attr_accessible  :user_id, :customer_name, :consume, :consume_type, :consume_value, :consume_describe
  end
end
