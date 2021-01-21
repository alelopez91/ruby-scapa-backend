class CreateCustomPictograms < ActiveRecord::Migration[6.0]
  def change
    create_table :custom_pictograms do |t|
      t.string :description
      t.references :custom_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
