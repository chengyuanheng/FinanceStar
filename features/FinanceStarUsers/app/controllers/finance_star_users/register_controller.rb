require_dependency "finance_star_users/application_controller"

module FinanceStarUsers
  class RegisterController < ApplicationController

    def new
      @user = User.new
    end

    def create
      @user = User.new(params[:user])
      @user.save

      respond_to do |format|
        if @user.save
          format.html { redirect_to signin_path, notice: 'User was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end

    end

  end

end
