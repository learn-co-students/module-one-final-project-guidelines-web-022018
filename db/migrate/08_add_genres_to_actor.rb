class AddGenresToActor < ActiveRecord::Migration[4.2]
  def change
    add_column :actors, :genre_id, :integer
  end
end
