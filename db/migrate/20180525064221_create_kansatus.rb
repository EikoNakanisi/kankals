class CreateKansatus < ActiveRecord::Migration[5.0]
  def change
    create_table :kansatus do |t|
      t.string :category
      t.string :ob_name
      t.string :n_1d
      t.string :j_1d
      t.string :s_2d
      t.string :n_2d
      t.string :j_2d
      t.string :s_3d
      t.string :n_3d
      t.string :j_3d
      t.string :s_4d
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
