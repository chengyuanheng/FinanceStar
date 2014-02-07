module FinanceManagement
  class Customer < ActiveRecord::Base

    attr_accessible  :user_id , :name, :phone, :email , :original_funds
    validates :name, :email, :phone, :uniqueness => true
    validates :phone, :presence => true , :length => {  :maximum => 11, :minimum => 11 }
    validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  end
end
