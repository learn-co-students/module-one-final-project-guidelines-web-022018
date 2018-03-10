class CreateSeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :seeds do |t|
      t.integer :user_id
      t.string :name
      t.text :seed
    end
  end
end
