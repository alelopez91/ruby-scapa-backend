module V1
  class CategoriesController < BaseController
    def index
      categories = Category.ordered_by_description.page(params[:page]).per(params[:per_page])

      render_successful_response(categories, CategorySerializer)
    end

    def show
      render_successful_response(category, CategorySerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    end

    def create
      new_category = Category.create!(category_params)

      render_successful_response(new_category, CategorySerializer)
    rescue ActionController::ParameterMissing
      render_bad_request
    rescue ActiveRecord::RecordInvalid
      render_unprocessable_entity
    end

    def update
      category.update!(category_params)

      render_successful_response(category, CategorySerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    rescue ActiveRecord::RecordInvalid
      render_unprocessable_entity
    end

    def destroy
      category.destroy!

      render_successful_response(category, CategorySerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    end

    private

    def category_params
      params.require(:category).permit(:description)
    end

    def category
      @category ||= Category.find(params[:id])
    end
  end
end
