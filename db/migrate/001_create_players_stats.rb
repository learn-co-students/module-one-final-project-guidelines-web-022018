class CreatePlayersStats < ActiveRecord::Migration[4.2]
  def change

    create_table :players_stats do |t|
          t.integer :game_number
          t.string :date
          t.string :name
          t.string :team
          t.string :opponent
          t.float :projected_pts
          t.integer :actual_pts
          t.float :projected_reb
          t.integer :actual_reb
          t.float :projected_ast
          t.integer :actual_ast
          t.float :projected_tov
          t.integer :actual_tov
          t.float :projected_stl
          t.integer :actual_stl
          t.float :projected_blk
          t.integer :actual_blk
          t.float :projected_fg3a
          t.integer :actual_fg3a
          t.float :projected_pf
          t.integer :actual_pf
          t.float :projected_fgm
          t.integer :actual_fgm
          t.float :projected_fga
          t.integer :actual_fga
          t.float :projected_oreb
          t.integer :actual_oreb
          t.float :projected_fta
          t.integer :actual_fta
          t.integer :game_id
          t.integer :player_id
        end
      end
    end
