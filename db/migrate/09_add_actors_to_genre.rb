class AddActorsToGenre < ActiveRecord::Migration[4.2]
  def change
    add_column :genres, :actor_id, :integer
  end
end
