module V1
  class PictogramsController < BaseController
    has_scope :by_category, only: :index, as: :category_id

    def index
      pictograms = apply_scopes(Pictogram).ordered_by_description.page(params[:page]).per(params[:per_page])

      render_successful_response(pictograms, PictogramSerializer)
    end
  end
end
