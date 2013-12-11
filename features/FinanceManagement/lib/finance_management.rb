require "finance_management/engine"

module FinanceManagementDependencies

  mattr_accessor :BaseControllerClass

end

FinanceManagementDependencies.BaseControllerClass = ActionController::Base
