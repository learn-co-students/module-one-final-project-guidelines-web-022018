class AddDirectorToMovie < ActiveRecord::Migration[4.2]
  def change
    add_column :movies, :director_id, :integer
  end
end
