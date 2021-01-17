module V1
  class PictogramsController < BaseController
    has_scope :by_category, only: :index, as: :category_id

    def index
      pictograms = apply_scopes(Pictogram).ordered_by_description.page(params[:page]).per(params[:per_page])

      render_successful_response(pictograms, PictogramSerializer)
    end

    def show
      render_successful_response(pictogram, PictogramSerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    end

    def create
      new_pictogram = Pictogram.create!(pictogram_params)

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
      params.require(:pictogram).permit(:description, :category_id)
    end

    def pictogram
      @pictogram ||= Pictogram.find(params[:id])
    end
  end
end