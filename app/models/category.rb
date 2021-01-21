class Category < ApplicationRecord
  validates :description, presence: true

  has_many :pictograms, dependent: :destroy

  scope :ordered_by_description, -> { order(description: :asc) }
end
