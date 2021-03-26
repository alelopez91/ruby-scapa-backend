class Remembrance < ApplicationRecord
  belongs_to :folder

  has_many :remembrance_pictograms, dependent: :destroy
  has_many :pictograms, through: :remembrance_pictograms

  scope :ordered_by_description, -> { order(description: :asc) }
end
