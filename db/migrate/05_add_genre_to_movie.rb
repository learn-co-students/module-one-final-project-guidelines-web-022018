class AddGenreToMovie < ActiveRecord::Migration[4.2]
  def change
    add_column :movies, :genre_id, :integer
  end
end
