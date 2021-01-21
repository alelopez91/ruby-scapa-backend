class CreateCustomCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :custom_categories do |t|
      t.string :description
      t.references :folder, null: false, foreign_key: true

      t.timestamps
    end
  end
end
