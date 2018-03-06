class AddSpotIdToTracks < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :spot_id, :string
  end
end
