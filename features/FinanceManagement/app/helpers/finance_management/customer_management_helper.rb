module FinanceManagement
  module CustomerManagementHelper


    def find_customer id
      Customer.find_by(id:id)
    end


  end
end
