require_dependency "finance_star_users/application_controller"
module FinanceStarUsers
  class RegisterController < ApplicationController

    def new
      @user = User.new
    end

    def create
      @user = User.new(params[:user])
      @user.save
      verify_code = generate_verify_code @user

      respond_to do |format|
        if @user.save
          MailerService.welcome_email(@user,verify_code).deliver
          save_user_id_to_session @user
          format.html { redirect_to signin_path, notice: 'User was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def generate_verify_code user
      verify_code = (rand(899999)+100000).to_s
      user_verify_code = FinanceStarUsers::UserVerifyCode.find_by(user_id:user.id)
      if user_verify_code.nil?
        user_verify_code = FinanceStarUsers::UserVerifyCode.create(user_id:user.id,code:verify_code)
      end
      user_verify_code.code
    end

    def save_user_id_to_session user
      session[:user_id] = user.id
    end
  end
end

