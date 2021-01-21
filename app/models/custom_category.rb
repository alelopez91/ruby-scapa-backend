class CustomCategory < ApplicationRecord
  validates :description, presence: true

  belongs_to :folder

  has_many :custom_pictograms

  scope :ordered_by_description, -> { order(description: :asc) }
end
