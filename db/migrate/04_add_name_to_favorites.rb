class AddNameToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :username, :string
  end
end
