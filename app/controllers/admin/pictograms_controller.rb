module Admin
  class PictogramsController < BaseController
    has_scope :by_category, only: :index, as: :category_id
    has_scope :by_description, only: :index

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
    rescue ActiveRecord::RecordInvalid => e
      render_unprocessable_entity(e.message)
    end

    def update
      pictogram.update!(pictogram_params)

      render_successful_response(pictogram, PictogramSerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    rescue ActiveRecord::RecordInvalid => e
      render_unprocessable_entity(e.message)
    end

    def destroy
      pictogram.destroy!

      render_successful_response(pictogram, PictogramSerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    end

    private

    def pictogram_params
      params.require(:pictogram).permit(:description, :classifiable_id, image: [:data, :filename])
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
