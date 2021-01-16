class PictogramSerializer
  include JSONAPI::Serializer
  attributes :description

  belongs_to :category
end
