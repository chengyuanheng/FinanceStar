require "spec_helper"
describe FinanceManagement::MyFinanceController do
  let(:user) { FactoryGirl.create(:non_admin_user) }

  routes { FinanceManagement::Engine.routes }

  before{ session[:user_id] = user.id }

  describe "#index" do
    subject { get :index}

    it "should get index page" do
      subject

      response.should be_success
      response.status.should eq(200)
    end
  end
end
