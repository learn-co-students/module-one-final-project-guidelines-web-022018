class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :artist_id
      t.integer :genre_id
      t.timestamp
    end
  end
end
