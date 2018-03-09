class CreateEvents < ActiveRecord::Migration[4.2]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :event_id
    end
  end
end
