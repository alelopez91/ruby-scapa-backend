class CreateRemembrancePictograms < ActiveRecord::Migration[6.0]
  def change
    create_table :remembrance_pictograms do |t|
      t.references :remembrance, null: false, foreign_key: true
      t.references :pictogram, null: false, foreign_key: true

      t.timestamps
    end
  end
end
