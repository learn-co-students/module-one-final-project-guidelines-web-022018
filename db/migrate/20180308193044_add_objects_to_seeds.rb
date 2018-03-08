class AddObjectsToSeeds < ActiveRecord::Migration[5.0]
  def change
    add_column :seeds, :objects, :text
  end
end
