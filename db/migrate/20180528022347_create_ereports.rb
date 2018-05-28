class CreateEreports < ActiveRecord::Migration[5.0]
  def change
    create_table :ereports do |t|
      t.references :patient, foreign_key: true
      t.text :ers
      t.datetime :ert
      t.string :erm

      t.timestamps
    end
  end
end
