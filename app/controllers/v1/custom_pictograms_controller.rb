module V1
  class CustomPictogramsController < BaseController
    has_scope :by_custom_category, only: :index, as: :custom_category_id

    def index
      custom_pictograms = apply_scopes(CustomPictogram).ordered_by_description.page(params[:page]).per(params[:per_page])

      render_successful_response(custom_pictograms, CustomPictogramSerializer)
    end

    def show
      render_successful_response(custom_pictogram, CustomPictogramSerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    end

    def create
      new_custom_pictogram = CustomPictogram.create!(custom_pictogram_params)

      render_successful_response(new_custom_pictogram, CustomPictogramSerializer)
    rescue ActionController::ParameterMissing
      render_bad_request
    rescue ActiveRecord::RecordInvalid
      render_unprocessable_entity
    end

    def update
      custom_pictogram.update!(custom_pictogram_params)

      render_successful_response(custom_pictogram, CustomPictogramSerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    rescue ActiveRecord::RecordInvalid
      render_unprocessable_entity
    end

    def destroy
      custom_pictogram.destroy!

      render_successful_response(custom_pictogram, CustomPictogramSerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    end

    private

    def custom_pictogram_params
      params.require(:custom_pictogram).permit(:description, :custom_category_id)
    end

    def custom_pictogram
      @custom_pictogram ||= CustomPictogram.find(params[:id])
    end
  end
end
