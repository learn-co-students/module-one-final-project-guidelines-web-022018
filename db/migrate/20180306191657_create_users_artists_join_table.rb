class CreateUsersArtistsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :artists do |t|
      t.index :user_id
      t.index :artist_id
    end
  end
end
