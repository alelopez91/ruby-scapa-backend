class CustomCategorySerializer
  include JSONAPI::Serializer
  attributes :description

  belongs_to :folder
end
