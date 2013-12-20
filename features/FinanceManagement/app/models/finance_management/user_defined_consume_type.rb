module FinanceManagement
  class UserDefinedConsumeType < ActiveRecord::Base

    attr_accessible  :user_id, :consume, :consume_type

  end
end
