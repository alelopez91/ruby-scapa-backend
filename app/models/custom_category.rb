class CustomCategory < ApplicationRecord
  validates :description, presence: true

  belongs_to :folder

  has_many :pictograms, as: :classifiable, dependent: :destroy

  scope :ordered_by_description, -> { order(description: :asc) }
end
