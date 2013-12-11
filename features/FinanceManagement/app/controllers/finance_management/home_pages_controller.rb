require_dependency "finance_management/application_controller"

module FinanceManagement
  class HomePagesController < ApplicationController
    before_action :set_home_page, only: [:show, :edit, :update, :destroy]

    # GET /home_pages
    def index
      @home_pages = HomePage.all
    end

    # GET /home_pages/1
    def show
    end

    # GET /home_pages/new
    def new
      @home_page = HomePage.new
    end

    # GET /home_pages/1/edit
    def edit
    end

    # POST /home_pages
    def create
      @home_page = HomePage.new(home_page_params)

      if @home_page.save
        redirect_to @home_page, notice: 'Home page was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /home_pages/1
    def update
      if @home_page.update(home_page_params)
        redirect_to @home_page, notice: 'Home page was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /home_pages/1
    def destroy
      @home_page.destroy
      redirect_to home_pages_url, notice: 'Home page was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_home_page
        @home_page = HomePage.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def home_page_params
        params[:home_page]
      end
  end
end
