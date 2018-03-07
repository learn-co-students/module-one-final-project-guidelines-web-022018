class AddNameToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :username, :string
  end
end
