class CategorySerializer
  include JSONAPI::Serializer
  attributes :description
  attribute :image_url, if: Proc.new{ |object| object.image.attached? } do |object|
    Rails.application.routes.url_helpers.rails_blob_url(object.image, only_path: true)
  end
end
