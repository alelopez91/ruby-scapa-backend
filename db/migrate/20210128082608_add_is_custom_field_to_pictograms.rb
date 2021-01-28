class AddIsCustomFieldToPictograms < ActiveRecord::Migration[6.0]
  def change
    add_column :pictograms, :is_custom, :boolean, default: false
  end
end
