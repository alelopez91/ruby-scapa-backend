class CustomPictogramSerializer
  include JSONAPI::Serializer
  attributes :description

  belongs_to :custom_category
end
