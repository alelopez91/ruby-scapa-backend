class Pictogram < ApplicationRecord
  belongs_to :category

  validates :description, presence: true

  scope :ordered_by_description, -> { order(description: :asc) }
  scope :by_category, ->(category_id) { where(category_id: category_id) }
end
