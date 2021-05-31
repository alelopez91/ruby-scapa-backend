module Admin
  class CategoriesController < BaseController
    has_scope :by_description, only: :index

    def index
      categories = retrieve_categories

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
    rescue ActiveRecord::RecordInvalid => e
      render_unprocessable_entity(e.message)
    end

    def update
      category.update!(category_params)

      render_successful_response(category, CategorySerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    rescue ActiveRecord::RecordInvalid => e
      render_unprocessable_entity(e.message)
    end

    def destroy
      category.destroy!

      render_successful_response(category, CategorySerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    end

    private

    def category_params
      params.require(:category).permit(:description, image: [:data, :filename])
    end

    def category
      @category ||= Category.find(params[:id])
    end

    def retrieve_categories
      apply_scopes(Category)
        .ordered_by_description
        .page(params[:page])
        .per(params[:per_page])
    end
  end
end
