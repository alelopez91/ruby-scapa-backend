module V1
  class CustomPictogramsController < BaseController
    has_scope :by_custom_category, only: :index, as: :custom_category_id

    def index
      custom_pictograms = retrieve_pictograms

      render_successful_response(custom_pictograms, PictogramSerializer)
    end

    def show
      render_successful_response(custom_pictogram, PictogramSerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    end

    def create
      completed_params = custom_pictogram_params.merge!(classifiable_type: 'CustomCategory', is_custom: true)

      new_custom_pictogram = Pictogram.create!(completed_params)

      render_successful_response(new_custom_pictogram, PictogramSerializer)
    rescue ActionController::ParameterMissing
      render_bad_request
    rescue ActiveRecord::RecordInvalid => e
      render_unprocessable_entity(e.message)
    end

    def update
      custom_pictogram.update!(custom_pictogram_params)

      render_successful_response(custom_pictogram, PictogramSerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    rescue ActiveRecord::RecordInvalid => e
      render_unprocessable_entity(e.message)
    end

    def destroy
      custom_pictogram.destroy!

      render_successful_response(custom_pictogram, PictogramSerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    end

    private

    def custom_pictogram_params
      params.require(:custom_pictogram).permit(:description, :classifiable_id, image: [:data, :filename])
    end

    def custom_pictogram
      @custom_pictogram ||= Pictogram.customs.find(params[:id])
    end

    def retrieve_pictograms
      apply_scopes(Pictogram)
        .customs
        .by_classifiable(current_folder.custom_categories)
        .ordered_by_description
        .page(params[:page])
        .per(params[:per_page])
    end
  end
end
