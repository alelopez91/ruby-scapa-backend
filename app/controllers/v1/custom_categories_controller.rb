module V1
  class CustomCategoriesController < BaseController
    def index
      custom_categories = current_user.custom_categories.ordered_by_description.page(params[:page]).per(params[:per_page])

      render_successful_response(custom_categories, CustomCategorySerializer)
    end

    def show
      render_successful_response(custom_category, CustomCategorySerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    end

    def create
      new_custom_category = current_folder.custom_categories.create!(custom_category_params)

      render_successful_response(new_custom_category, CustomCategorySerializer)
    rescue ActionController::ParameterMissing
      render_bad_request
    rescue ActiveRecord::RecordInvalid
      render_unprocessable_entity
    end

    def update
      custom_category.update!(custom_category_params)

      render_successful_response(custom_category, CustomCategorySerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    rescue ActiveRecord::RecordInvalid
      render_unprocessable_entity
    end

    def destroy
      custom_category.destroy!

      render_successful_response(custom_category, CustomCategorySerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    end

    private

    def custom_category_params
      params.require(:custom_category).permit(:description, image: [:data, :filename])
    end

    def custom_category
      @custom_category ||= current_user.custom_categories.find(params[:id])
    end
  end
end
