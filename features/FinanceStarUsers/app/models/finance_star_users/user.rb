module FinanceStarUsers
  class User < ActiveRecord::Base

    attr_accessible :id, :name, :email, :password, :phone, :admin
    validates :email, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
    validates :name, :email, :phone, :uniqueness => true
    validates :name, :email, :phone, :password, :presence => true


    def self.authenticate(email, submitted_password)
      user = find_by_email(email)
      return nil if user.nil?
      return user if user.has_password?(submitted_password)
    end

    def has_password?(submitted_password)
      password == submitted_password
    end

    #def self.not_admin
    #  user = find_all_by_admin false
    #  return user
    #end

  end
end
