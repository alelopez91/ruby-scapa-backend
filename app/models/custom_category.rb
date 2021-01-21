class CustomCategory < ApplicationRecord
  validates :description, presence: true

  belongs_to :folder

  scope :ordered_by_description, -> { order(description: :asc) }
end
