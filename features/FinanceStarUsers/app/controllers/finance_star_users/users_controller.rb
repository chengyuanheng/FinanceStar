require_dependency "finance_star_users/application_controller"
module FinanceStarUsers
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    # GET /users
    def index
      @users = User.not_admin.paginate(:page => params[:page], :per_page => 10)
    end

    # GET /users/1
    def show
    end

    # GET /users/new
    def new
      @user = User.new
    end

    # GET /users/1/edit
    def edit
    end

    # POST /users
    def create
      @user = User.new(user_params)
      @user.save
      verify_code = generate_verify_code @user
      if @user.save
        MailerService.welcome_email(@user,verify_code).deliver
        redirect_to @user, notice: 'User was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /users/1
    def destroy
      @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def user_params
        params.require(:user).permit(:name, :email, :password, :phone, :admin)
      end

      def generate_verify_code user
        verify_code = (rand(899999)+100000).to_s
        user_verify_code = FinanceStarUsers::UserVerifyCode.find_by(user_id:user.id)
        if user_verify_code.nil?
          user_verify_code = FinanceStarUsers::UserVerifyCode.create(user_id:user.id,code:verify_code)
        end
        user_verify_code.code
      end
  end
end
