class CreateUsersGenresJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :genres do |t|
      t.index :user_id
      t.index :genre_id
    end
  end
end
