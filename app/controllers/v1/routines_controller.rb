module V1
  class RoutinesController < BaseController
    def index
      routines = Routine.ordered_by_description.page(params[:page]).per(params[:per_page])

      render_successful_response(routines, RoutineSerializer)
    end

    def show
      render_successful_response(routine, RoutineSerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    end

    private

    def routine
      @routine ||= Routine.find(params[:id])
    end
  end
end
