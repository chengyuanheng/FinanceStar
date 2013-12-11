require 'test_helper'

module FinanceManagement
  class HomePagesControllerTest < ActionController::TestCase
    setup do
      @home_page = home_pages(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:home_pages)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create home_page" do
      assert_difference('HomePage.count') do
        post :create, home_page: {  }
      end

      assert_redirected_to home_page_path(assigns(:home_page))
    end

    test "should show home_page" do
      get :show, id: @home_page
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @home_page
      assert_response :success
    end

    test "should update home_page" do
      patch :update, id: @home_page, home_page: {  }
      assert_redirected_to home_page_path(assigns(:home_page))
    end

    test "should destroy home_page" do
      assert_difference('HomePage.count', -1) do
        delete :destroy, id: @home_page
      end

      assert_redirected_to home_pages_path
    end
  end
end
