require 'csv'



CSV.foreach("./players_stats.csv", {encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
  # binding.pry
  stat = PlayersStat.first_or_create(row.to_h)
  player = Player.where(full_name: stat.name, team: stat.team).first_or_create
  game = Game.find_or_create_by(id: stat.game_number)
  if !game.home_team
  	game.update(home_team: stat.team , away_team: stat.opponent , date: stat.date)
  end
  stat.game = game
  stat.player = player
  game.players_stats << stat
  player.players_stats << stat
end
