class RemoveCustomPictogramTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :custom_pictograms
  end
end
