class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  def render_not_found
    render status: :not_found
  end

  def render_bad_request
    render status: :bad_request
  end

  def render_unprocessable_entity
    render status: :unprocessable_entity
  end

  def render_successful_response(object, serializer)
    serialized_object = serialize_object(object, serializer)

    render json: serialized_object, status: :ok
  end

  def serialize_object(object, serializer)
    extra_data = add_pagination_data(object)

    serializer.new(object, extra_data).serializable_hash.to_json
  end

  def add_pagination_data(object)
    extra_data = {}

    if is_a_collection?(object)
      extra_data[:meta] = {
        limit_value: object.limit_value,
        total_pages: object.total_pages,
        current_page: object.current_page,
        next_page: object.next_page,
        prev_page: object.prev_page,
        is_first_page: object.first_page?,
        is_last_page: object.last_page?
      }
    end

    extra_data
  end

  def is_a_collection?(object)
    object.is_a?(ActiveRecord::Relation)
  end
end
