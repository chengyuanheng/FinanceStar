module FinanceStarUsers
  class UserVerifyCode < ActiveRecord::Base
    attr_accessible :user_id,:code,:has_validate
  end
end
