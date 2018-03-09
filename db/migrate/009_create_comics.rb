class CreateComics < ActiveRecord::Migration[4.2]
  def change
    create_table :comics do |t|
      t.string :name
      t.integer :comic_id
    end
  end
end
