class Routine < ApplicationRecord
  has_many :pictogram_routines
  has_many :pictograms, through: :pictogram_routines

  scope :ordered_by_description, -> { order(description: :asc) }
end
