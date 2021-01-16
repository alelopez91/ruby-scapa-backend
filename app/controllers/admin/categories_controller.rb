module Admin
  class CategoriesController < BaseController
    def index
      categories = Category.all

      render_successful_response(categories, CategorySerializer)
    end

    def show
      category = Category.find(params[:id])

      render_successful_response(category, CategorySerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    end
  end
end
