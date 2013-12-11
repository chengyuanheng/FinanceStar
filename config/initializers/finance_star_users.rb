
FinanceStarUsers.signin_redirect_path = '/finance_management/index'
FinanceStarUsers.BaseControllerClass = Class.new(ActionController::Base) do

  layout 'application'
  before_action :init_assets

  private
  def init_assets
    @custom_css = @custom_js = 'finance_star_users/application'
  end
end




