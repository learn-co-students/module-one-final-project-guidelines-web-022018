class CreateWinners < ActiveRecord::Migration[4.2]
  def change
    create_table :winners do |t|
      t.string :name
    end
  end
end
