module V1
  class CategoriesController < BaseController
    def index
      categories = Category.ordered_by_description.page(params[:page]).per(params[:per_page])

      render_successful_response(categories, CategorySerializer)
    end
  end
end
