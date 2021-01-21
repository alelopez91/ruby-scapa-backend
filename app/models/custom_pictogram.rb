class CustomPictogram < ApplicationRecord
  validates :description, presence: true

  belongs_to :custom_category

  scope :ordered_by_description, -> { order(description: :asc) }
  scope :by_custom_category, ->(custom_category_id) { where(custom_category_id: custom_category_id) }
end
