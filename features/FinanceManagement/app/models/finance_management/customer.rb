module FinanceManagement
  class Customer < ActiveRecord::Base

    attr_accessible  :name, :phone, :email , :original_funds
    validates :name, :email, :phone, :uniqueness => true
    validates :phone, :presence => true

  end
end
