module FinanceManagement
  class ApplicationController < FinanceManagementDependencies.BaseControllerClass
    before_filter :non_admin_authenticate

  end
end
