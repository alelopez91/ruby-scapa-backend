module V1
  class CategoriesController < BaseController
    def index
      @categories = Category.all

      render json: @categories, status: :ok
    end
  end
end
