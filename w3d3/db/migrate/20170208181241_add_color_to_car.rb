class AddColorToCar < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :color, :string, null: false
    add_index :cars, :owner_id
  end
end
