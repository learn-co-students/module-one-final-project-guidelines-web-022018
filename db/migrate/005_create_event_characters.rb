class CreateEventCharacters < ActiveRecord::Migration[4.2]
  def change
    create_table :event_characters do |t|
      t.integer :event_id
      t.integer :character_id
    end
  end
end
