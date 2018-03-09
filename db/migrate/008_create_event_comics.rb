class CreateEventComics < ActiveRecord::Migration[4.2]
  def change
    create_table :event_comics do |t|
      t.integer :event_id
      t.integer :comic_id
    end
  end
end
