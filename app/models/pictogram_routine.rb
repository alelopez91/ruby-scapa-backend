class PictogramRoutine < ApplicationRecord
  default_scope { order(:id) }

  belongs_to :pictogram
  belongs_to :routine
end
