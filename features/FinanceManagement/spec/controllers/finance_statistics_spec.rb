require "spec_helper"
describe FinanceManagement::FinanceStatisticsController do
  routes { FinanceManagement::Engine.routes }

  describe "#index" do
    subject { get :index}

    it "should get index page" do
      subject

      response.status.should eq(302)
    end
  end
end
