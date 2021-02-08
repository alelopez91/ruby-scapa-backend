class PictogramSerializer
  include JSONAPI::Serializer
  attributes :description, :image

  belongs_to :classifiable, serializer: Proc.new { |record|
    "#{record.class}Serializer".constantize
  }
end
