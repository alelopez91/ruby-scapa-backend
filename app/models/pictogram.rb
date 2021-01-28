class Pictogram < ApplicationRecord
  validates :description, presence: true

  belongs_to :classifiable, polymorphic: true

  has_many :pictogram_routines
  has_many :routines, through: :pictogram_routines
  has_many :remembrance_pictograms
  has_many :remembrances, through: :remembrance_pictograms

  scope :ordered_by_description, -> { order(description: :asc) }
  scope :by_category, ->(category_id) { where(classifiable_id: category_id, classifiable_type: 'Category') }
  scope :by_custom_category, ->(category_id) { where(classifiable_id: category_id, classifiable_type: 'CustomCategory') }
  scope :customs, -> { where(is_custom: true) }
  scope :not_customs, -> { where(is_custom: false) }
end
