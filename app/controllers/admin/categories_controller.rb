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

    def create
      category = Category.create!(category_params)

      render_successful_response(category, CategorySerializer)
    rescue ActionController::ParameterMissing
      render_bad_request
    rescue ActiveRecord::RecordInvalid
      render_unprocessable_entity
    end

    def update
      category = Category.find(params[:id])

      category.update!(category_params)

      render_successful_response(category, CategorySerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    rescue ActiveRecord::RecordInvalid
      render_unprocessable_entity
    end

    private

    def category_params
      params.require(:category).permit(:description)
    end
  end
end
