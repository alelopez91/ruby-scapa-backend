module V1
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

    private

    def retrieve_pictograms
      apply_scopes(Pictogram)
        .not_customs
        .ordered_by_description
        .page(params[:page])
        .per(params[:per_page])
    end

    def pictogram
      @pictogram ||= Pictogram.not_customs.find(params[:id])
    end
  end
end
