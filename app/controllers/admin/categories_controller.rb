module Admin
  class CategoriesController < BaseController
    def index
      @categories = Category.all

      render json: @categories, status: :ok
    end
  end
end
