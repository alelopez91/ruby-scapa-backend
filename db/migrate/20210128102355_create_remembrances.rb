class CreateRemembrances < ActiveRecord::Migration[6.0]
  def change
    create_table :remembrances do |t|
      t.string :description
      t.references :folder, null: false, foreign_key: true

      t.timestamps
    end
  end
end
