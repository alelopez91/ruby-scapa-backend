module Admin
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

    def create
      new_routine = Routine.create!(routine_params)

      render_successful_response(new_routine, RoutineSerializer)
    rescue ActionController::ParameterMissing
      render_bad_request
    rescue ActiveRecord::RecordInvalid
      render_unprocessable_entity
    end

    def update
      routine.update!(routine_params)

      render_successful_response(routine, RoutineSerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    rescue ActiveRecord::RecordInvalid
      render_unprocessable_entity
    end

    def destroy
      routine.destroy!

      render_successful_response(routine, RoutineSerializer)
    rescue ActiveRecord::RecordNotFound
      render_not_found
    end

    private

    def routine_params
      params.require(:routine).permit(:description, :pictogram_ids)
    end

    def routine
      @routine ||= Routine.find(params[:id])
    end
  end
end
