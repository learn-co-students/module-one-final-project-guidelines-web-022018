class AddNameToFavorites < ActiveRecord::Migration[4.2]
  def change
    add_column :favorites, :username, :string
  end
end
