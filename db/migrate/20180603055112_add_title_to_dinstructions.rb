class AddTitleToDinstructions < ActiveRecord::Migration[5.0]
  def change
    add_column :dinstructions, :gotime, :datetime
  end
end
