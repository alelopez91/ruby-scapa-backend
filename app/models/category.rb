class Category < ApplicationRecord
  validates :description, presence: true

  has_many :pictograms, as: :classifiable, dependent: :destroy

  scope :ordered_by_description, -> { order(description: :asc) }
end
