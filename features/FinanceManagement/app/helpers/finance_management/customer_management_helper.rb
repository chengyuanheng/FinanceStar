module FinanceManagement
  module CustomerManagementHelper


    def find_customer id

      customer = Customer.find_by(id:id)

    end


  end
end
