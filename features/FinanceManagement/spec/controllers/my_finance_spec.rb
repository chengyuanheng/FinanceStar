require "spec_helper"

describe FinanceManagement::MyFinanceController do

  let(:user) { FactoryGirl.create(:non_admin_user) }

  routes { FinanceManagement::Engine.routes }

  before do
    session[:user_id] = user.id
  end

  describe "#index" do

    subject { get :index}

    it "should get index page" do

    end

  end


end
