class Player < ActiveRecord::Base
  has_many :players_stats
  has_many :games, through: :players_stats

  def find_by_player_name
    "Please enter a player's full name"
    name = gets.chomp
    player = Player.find_by(full_name: name)
    until player
      "Sorry, a player by that name could not be found."
      name = gets.chomp
    end
    player
  end
end
