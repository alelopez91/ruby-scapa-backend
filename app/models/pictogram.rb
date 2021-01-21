class Pictogram < ApplicationRecord
  validates :description, presence: true

  belongs_to :category

  has_many :pictogram_routines
  has_many :routines, through: :pictogram_routines

  scope :ordered_by_description, -> { order(description: :asc) }
  scope :by_category, ->(category_id) { where(category_id: category_id) }
end
