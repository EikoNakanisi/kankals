class CreateDreports < ActiveRecord::Migration[5.0]
  def change
    create_table :dreports do |t|
      t.references :patient, foreign_key: true
      t.text :drs
      t.text :dro
      t.text :dra
      t.text :drp
      t.datetime :drt

      t.timestamps
    end
  end
end
