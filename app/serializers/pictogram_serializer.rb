class PictogramSerializer
  include JSONAPI::Serializer
  attributes :description

  belongs_to :classifiable, serializer: Proc.new { |record|
    "#{record.class}Serializer".constantize
  }
end
