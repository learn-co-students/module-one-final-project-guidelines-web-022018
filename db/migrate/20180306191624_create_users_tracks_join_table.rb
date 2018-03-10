class CreateUsersTracksJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :tracks do |t|
      t.index :user_id
      t.index :track_id
    end
  end
end
