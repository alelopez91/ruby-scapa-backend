class RemembranceSerializer
  include JSONAPI::Serializer
  attributes :description

  has_many :pictograms
end
