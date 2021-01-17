class Routine < ApplicationRecord
  has_many :pictogram_routines
  has_many :pictograms, through: :pictogram_routines
end
