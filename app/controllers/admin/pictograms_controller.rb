module Admin
  class PictogramsController < BaseController
    def index
      pictograms = Pictogram.ordered_by_description

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
