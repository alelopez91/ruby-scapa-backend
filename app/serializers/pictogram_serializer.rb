class PictogramSerializer
  include JSONAPI::Serializer

  attributes :description, :is_custom
  attribute :image_url, if: Proc.new{ |object| object.image.attached? } do |object|
    Rails.application.routes.url_helpers.rails_blob_url(object.image, only_path: true)
  end

  belongs_to :classifiable, serializer: Proc.new { |record|
    "#{record.class}Serializer".constantize
  }
end
