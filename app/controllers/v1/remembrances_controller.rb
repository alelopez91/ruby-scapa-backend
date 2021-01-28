module V1
  class RemembrancesController < BaseController
    def index
      remembrances = current_folder.remembrances.ordered_by_description.page(params[:page]).per(params[:per_page])

      render_successful_response(remembrances, RemembranceSerializer)
    end

    def show
      render_successful_response(remembrance, RemembranceSerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    end

    def create
      new_remembrance = current_folder.remembrances.create!(remembrance_params)

      render_successful_response(new_remembrance, RemembranceSerializer)
    rescue ActionController::ParameterMissing
      render_bad_request
    rescue ActiveRecord::RecordInvalid
      render_unprocessable_entity
    end

    def update
      remembrance.update!(remembrance_params)

      render_successful_response(remembrance, RemembranceSerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    rescue ActiveRecord::RecordInvalid
      render_unprocessable_entity
    end

    def destroy
      remembrance.destroy!

      render_successful_response(remembrance, RemembranceSerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    end

    private

    def remembrance_params
      params.require(:remembrance).permit(:description, pictogram_ids: [])
    end

    def remembrance
      @remembrance ||= current_folder.remembrances.find(params[:id])
    end

    def current_folder
      current_user.folder
    end
  end
end
