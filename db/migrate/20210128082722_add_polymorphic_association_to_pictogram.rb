class AddPolymorphicAssociationToPictogram < ActiveRecord::Migration[6.0]
  def change
    add_column :pictograms, :classifiable_id, :integer
    add_column :pictograms, :classifiable_type, :string
  end
end
