class Category < ApplicationRecord
  include PgSearch::Model

  validates :description, presence: true, uniqueness: true

  has_many :pictograms, as: :classifiable, dependent: :destroy

  scope :ordered_by_description, -> { order(description: :asc) }

  pg_search_scope :by_description, against: :description, using: {
                    tsearch: { prefix: true }
                  }
end
