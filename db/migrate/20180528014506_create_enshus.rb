class CreateEnshus < ActiveRecord::Migration[5.0]
  def change
    create_table :enshus do |t|
      t.date :kisaibi
      t.integer :age
      t.integer :kiou
      t.integer :katudou
      t.integer :ninsiki
      t.integer :haisetu
      t.integer :med1
      t.integer :med2
      t.integer :med3
      t.integer :med4
      t.integer :med5
      t.integer :kankyo1
      t.integer :kankyo2
      t.integer :goukei
      t.integer :kikendo
      t.string :yobou
      t.string :string

      t.timestamps
    end
  end
end
