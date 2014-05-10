require "spec_helper"

describe FinanceManagement::CustomerManagementController do

  let(:user) { FactoryGirl.create(:non_admin_user) }

  routes { FinanceManagement::Engine.routes }

  before do
    session[:user_id] = user.id
  end

  describe "#index" do

    subject { get :index}

    it "should get index page" do
      subject
      response.should be_success
      response.status.should eq(200)
    end

  end

  describe "#add_new_customer" do

    subject {post :add_new_customer ,params}

    let(:params){ {
                    :new_customer=>{
                                    :name=>"cc",
                                    :phone=>"18733171780",
                                    :email=>"237178842@qq.com",
                                    :original_funds=>"100"}
                  } }

    it "should create a new customer" do
      subject

      new_customer = FinanceManagement::Customer.find_by(phone:"18733171780")
      new_customer.name.should eq("cc")
    end

    it "should tip create customer success" do
      subject

      flash[:create_new_customer].should eq("success")
    end

    it "should redirect to index page" do
      subject

      response.status.should eq(302)
    end

  end

  describe "#edit_customer" do

    subject {post :edit_customer ,params}

    let(:params){ {
                    :edit_customer=>{
                        :phone => "18733171780",
                        :name => "kk",
                        :email => "237178843@qq.com",
                        :original_funds => "200"
                    }
                  }
                }

    before do

      FactoryGirl.create(:customer,user_id:user.id)

    end

    it "should update the customer context" do
      subject

      customer = FinanceManagement::Customer.find_by(phone:"18733171780")
      customer.name.should eq("kk")
      customer.email.should eq("237178843@qq.com")
      customer.original_funds.should eq(200)

    end

    it "should redirect to index page" do
      subject

      response.should redirect_to '/finance_management/customer_management/index'
    end

  end

  describe "#delete_customer" do
    subject{post :delete_customer , params}

    before do
      @customer = FactoryGirl.create(:customer,user_id:user.id)
    end
    let(:params){ {:id=>@customer.id}}


    it "should delete the old customer" do
      subject

      old_customer = FinanceManagement::Customer.find_by(phone:"18733171780")
      old_customer.should eq(nil)

    end

    it "should redirect to index page" do
      subject

      response.should redirect_to '/finance_management/customer_management/index'

    end
  end
end
