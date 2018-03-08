class AddFeaturesToTables < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :acousticness, :float
    add_column :tracks, :danceability, :float
    add_column :tracks, :energy, :float
    add_column :tracks, :instrumentalness, :float
    add_column :tracks, :valence, :float
    add_column :tracks, :tempo, :float
  end
end
