class CreateNinstructions < ActiveRecord::Migration[5.0]
  def change
    create_table :ninstructions do |t|
      t.references :patient, foreign_key: true
      t.datetime :yoteitime
      t.datetime :acttime
      t.integer :actflag
      t.string :sijiname
      t.string :siji

      t.timestamps
    end
  end
end
