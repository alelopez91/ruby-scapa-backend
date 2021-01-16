class CategorySerializer
  include JSONAPI::Serializer
  attributes :id, :description
end
