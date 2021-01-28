class PictogramSerializer
  include JSONAPI::Serializer
  attributes :description

  belongs_to :classifiable, serializer: Proc.new { |record, params|
    params[:is_custom] == true ? CustomCategorySerializer : CategorySerializer
  }
end
