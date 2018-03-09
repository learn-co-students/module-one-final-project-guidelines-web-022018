class CreateNominations < ActiveRecord::Migration[4.2]
  def change
    create_table :nominations do |t|
      t.string :category_name
      t.integer :year
      t.integer :win
      t.integer :nominee_id
      t.integer :movie_id
    end
  end
end
