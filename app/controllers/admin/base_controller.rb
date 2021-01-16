module Admin
  class BaseController < ApplicationController
    before_action :authenticate_admin_user!

    def render_not_found
      render status: :not_found
    end

    def render_bad_request
      render status: :bad_request
    end

    def render_successful_response(object, serializer)
      serialized_object = serializer.new(object).serializable_hash.to_json

      render json: serialized_object, status: :ok
    end
  end
end
