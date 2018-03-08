class CreateFavorites < ActiveRecord::Migration[4.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :beer_id
    end
  end
end
