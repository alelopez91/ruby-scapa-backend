class Category < ApplicationRecord
  has_many :pictograms, dependent: :destroy
  validates :description, presence: true

  scope :ordered_by_description, -> { order(description: :asc) }
end
