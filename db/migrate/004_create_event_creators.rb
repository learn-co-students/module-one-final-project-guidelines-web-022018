class CreateEventCreators < ActiveRecord::Migration[4.2]
  def change
    create_table :event_creators do |t|
      t.integer :event_id
      t.integer :creator_id
    end
  end
end
