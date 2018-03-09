class AddColumnToNominations < ActiveRecord::Migration[4.2]
  def change
    add_column :nominations, :ceremony, :integer
  end
end
