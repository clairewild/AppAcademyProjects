class DropColumn < ActiveRecord::Migration
  def change
    remove_column :responses, :text
  end
end
