# all player ids
# corresponding projected and actual stats
class CreateGames < ActiveRecord::Migration[4.2]
  def change
    create_table :games do |t|
      t.string :home_team
      t.string :away_team
      t.datetime :date
    end
  end
end
