class CreateDinstructions < ActiveRecord::Migration[5.0]
  def change
    create_table :dinstructions do |t|
      t.references :patient, foreign_key: true
      t.string :sijiname
      t.text :siji
      t.integer :sijiflag

      t.timestamps
    end
  end
end
