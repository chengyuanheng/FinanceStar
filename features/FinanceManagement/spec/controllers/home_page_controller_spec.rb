require "spec_helper"

describe FinanceManagement::HomePageController do

  describe "#index" do

    routes { FinanceManagement::Engine.routes }

    subject { get :index}

    it "should get index page" do
      subject
      response.should be_success
      response.status.should eq(200)
    end


  end


end
