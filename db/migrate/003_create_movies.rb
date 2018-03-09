class CreateMovies < ActiveRecord::Migration[4.2]
  def change
    create_table :movies do |t|
      t.string :name
    end
  end
end
