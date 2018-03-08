class CreateActorsMovies < ActiveRecord::Migration[4.2]

  def change
    create_table :actors_movies do |t|
      t.integer :actor_id
      t.integer :movie_id
    end
  end
end
