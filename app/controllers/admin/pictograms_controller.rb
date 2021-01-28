module Admin
  class PictogramsController < BaseController
    has_scope :by_category, only: :index, as: :category_id

    def index
      pictograms = retrieve_pictograms

      render_successful_response(pictograms, PictogramSerializer)
    end

    def show
      render_successful_response(pictogram, PictogramSerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    end

    def create
      completed_params = pictogram_params.merge!(classifiable_type: 'Category')

      new_pictogram = Pictogram.create!(completed_params)

      render_successful_response(new_pictogram, PictogramSerializer)
    rescue ActionController::ParameterMissing
      render_bad_request
    rescue ActiveRecord::RecordInvalid
      render_unprocessable_entity
    end

    def update
      pictogram.update!(pictogram_params)

      render_successful_response(pictogram, PictogramSerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    rescue ActiveRecord::RecordInvalid
      render_unprocessable_entity
    end

    def destroy
      pictogram.destroy!

      render_successful_response(pictogram, PictogramSerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    end

    private

    def pictogram_params
      params.require(:pictogram).permit(:description, :classifiable_id)
    end

    def pictogram
      @pictogram ||= Pictogram.not_customs.find(params[:id])
    end

    def retrieve_pictograms
      apply_scopes(Pictogram)
        .not_customs
        .ordered_by_description
        .page(params[:page])
        .per(params[:per_page])
    end
  end
end
