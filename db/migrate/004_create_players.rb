# all the game ids
# corresponding projected and actual stats

class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :full_name
      t.string :team
    end
  end
end
