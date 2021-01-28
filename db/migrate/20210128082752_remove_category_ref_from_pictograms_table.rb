class RemoveCategoryRefFromPictogramsTable < ActiveRecord::Migration[6.0]
  def change
    remove_reference :pictograms, :category, null: false, foreign_key: true
  end
end
