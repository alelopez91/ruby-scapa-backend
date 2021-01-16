class Pictogram < ApplicationRecord
  belongs_to :category

  validates :description, presence: true

  scope :ordered_by_description, -> { order(description: :asc) }
end
