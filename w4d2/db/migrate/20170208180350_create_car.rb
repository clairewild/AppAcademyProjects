class CreateCar < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.integer :yr, null: false
      t.string :make, null: false
      t.string :model, null: false
      t.integer :owner_id, null: false
    end
  end
end
