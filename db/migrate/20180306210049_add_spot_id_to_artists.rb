class AddSpotIdToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :spot_id, :string
  end
end
