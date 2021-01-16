class Category < ApplicationRecord
  validates :description, presence: true

  scope :ordered_by_description, -> { order(description: :asc) }
end
