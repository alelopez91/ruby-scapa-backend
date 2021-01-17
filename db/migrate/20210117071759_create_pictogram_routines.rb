class CreatePictogramRoutines < ActiveRecord::Migration[6.0]
  def change
    create_table :pictogram_routines do |t|
      t.references :pictogram, null: false, foreign_key: true
      t.references :routine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
