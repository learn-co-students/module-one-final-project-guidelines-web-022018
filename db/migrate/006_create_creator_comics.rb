class CreateCreatorComics < ActiveRecord::Migration[4.2]
  def change
    create_table :creator_comics do |t|
      t.integer :creator_id
      t.integer :comic_id
    end
  end
end
