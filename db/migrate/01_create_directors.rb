class CreateDirectors < ActiveRecord::Migration[4.2]
  def change
    create_table :directors do |t|
      t.string :name
    end
  end #change
end #class
