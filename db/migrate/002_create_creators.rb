class CreateCreators < ActiveRecord::Migration[4.2]
  def change
    create_table :creators do |t|
      t.string :name
      t.integer :creator_id
    end
  end
end
