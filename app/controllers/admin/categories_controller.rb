class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_KEY"], password: ENV["PASSWORD_KEY"]
    # before_filter :authenticate

    def index
        @categories = Category.order(id: :desc).all
    end
    
      def new
        @category = Category.new
      end
    
      def create
        @category = Category.new(category_params)
    
        if @category.save
          redirect_to [:admin, :categories], notice: 'Category created!'
        else
          render :new
        end

      end
    
    # def authenticate 
    #   authenticate_or_request_with_http_basic do |username, password| 
    #     username == ENV["ADMIN_KEY"] && password == ENV["PASSWORD_KEY"]
    #   end
    # end
  end
    
    def category_params
        params.require(:category).permit(
          :name,
          :created_at,
          :updated_at
        )
    end

