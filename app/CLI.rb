
def greeting
	a = Artii::Base.new
	puts a.asciify(" +* Welcome to *+")
	puts a.asciify("NBA stats Alley-OOP")
end


def prompt_player_name
	puts "\nEnter player name:"
	puts '(type help for player list)'
	name = gets.chomp.split(' ').map(&:capitalize).join(' ')
	if name == 'Help'
		puts Player.distinct.pluck(:full_name).sort
		puts "\n Enter player name:"
		name = gets.chomp.split(' ').map(&:capitalize).join(' ')
	end
	player = Player.find_by(full_name: name)
	until player
		puts 'INVALID PLAYER'
		puts "\nEnter player name:"
		puts '(type help for player list)'
		name = gets.chomp.split(' ').map(&:capitalize).join(' ')
		player = Player.find_by(full_name: name)
	end
	PlayersStat.where(player_id: player.id)
end

def print_to_csv(player_stats)
	file_name = 'stats_export.csv'
	CSV.open(file_name, 'w') do |csv|
		csv << player_stats[0].attributes.keys
		player_stats.each do |stat|
			csv << stat.attributes.values
		end
	end
	puts "Stats sent to #{file_name} - will be overwritten if you don't save elsewhere!"
end


def display_past_stats(player_stats, stat)
	proj = ('projected_' + stat)
	act = ('actual_' + stat)
	puts "\n opponent | #{proj} | #{act}"
	total_proj = 0.0
	total_act = 0.0
	count = 0.0

	player_stats.each do |row|
		puts "    #{row.opponent}   |      #{row.send(proj).round(1)}      |     #{row.send(act)}"
		count += 1
		total_proj += row.send(proj)
		total_act += row.send(act)
	end

	avg_proj = total_proj/count
	avg_act = total_act/count
	puts "----------------------------------------"
	puts "    AVG   |      #{avg_proj.round(1)}      |     #{avg_act.round(1)}"
	player_stats

end


def prompt_team_name(opponent=false)
	puts "\nEnter team name:"
	puts '(type help for team list)'
	team = gets.chomp.upcase
	team_names = PlayersStat.distinct.pluck(:team).sort
	if team == 'HELP'
		puts team_names
		puts "\nEnter team name:"
		team = gets.chomp.upcase
	end
	until team_names.include?(team)
		puts 'INVALID TEAM'
		puts "\nEnter team name:"
		puts '(type help for team list)'
		team = gets.chomp.upcase
	end
	if opponent
		PlayersStat.where(opponent: team)
	else
		PlayersStat.where(team: team)
	end

end

def prompt_stat
	puts "\nEnter stat to get:"
	puts '(type help for stat list)'
	glossary = {'pts'=>'points','reb'=>'rebounds','ast'=>'assists','tov'=>'turnovers','stl'=>'steals','blk'=>'blocks','fg3a'=>'3 pt field goal attempts','pf'=>'personal fouls','fgm'=>'field goals made','fga'=>'field goal attempts','oreb'=>'offensive rebounds','fta'=>'free throw attempts'}
	stat = gets.chomp.downcase
	columns = PlayersStat.column_names.map {|col| col.split('_')[-1] if col.include?('projected')}
	columns.compact!
	if stat == 'help'
		puts ''
		columns.each {|col| puts col + ' - ' + glossary[col]}
		puts "\nEnter stat to get:"
		stat = gets.chomp.downcase
	end
	until columns.include?(stat)
		puts 'INVALID STAT'
		puts "\nEnter stat to get:"
		puts '(type help for stat list)'
		stat = gets.chomp.downcase
	end
	stat
end

def select_option
	puts "\nSelect option:"
	puts '1 -> player stat, 2 -> team stat, 3 -> opponent stat 4 -> quit'

	input = gets.chomp.to_i
	until (1..4) === input
		puts 'INVALID OPTION'
		puts 'Select option:'
		puts '1 -> player stat, 2 -> team stat, 3 -> opponent stat 4 -> quit'
		input = gets.chomp.to_i
	end
	input
end

def get_next_step
	puts "\nType 'new' for a new query, 'csv' to save last query to csv, or 'exit' to exit program:"
	input = gets.chomp.downcase
	until input == 'new' || input == 'csv' || input == 'exit'
		puts 'INVALID OPTION'
		puts "\nType 'new' for a new query, 'csv' to save last query to csv and move to a new query, or 'exit' to exit program:"
		input = gets.chomp.downcase
	end
	input
end


def start_interface
	greeting
	opt = select_option
	until opt == 4
		if opt == 1
			player_stats = prompt_player_name
			stat = prompt_stat
			to_csv = display_past_stats(player_stats, stat)
		elsif opt == 2
			team_stats = prompt_team_name
			stat = prompt_stat
			to_csv = display_past_stats(team_stats.select("opponent, sum(projected_#{stat}) as projected_#{stat}, sum(actual_#{stat}) as actual_#{stat}").group(:game_id), stat)
		elsif opt == 3
			team_stats = prompt_team_name(opponent=true)
			stat = prompt_stat
			to_csv = display_past_stats(team_stats.select("team as opponent, sum(projected_#{stat}) as projected_#{stat}, sum(actual_#{stat}) as actual_#{stat}").group(:game_id), stat)
		end
		next_step = get_next_step
		if next_step == 'new'
			opt = select_option
		elsif next_step == 'csv'
			print_to_csv(to_csv)
			opt = select_option
		else
			a = Artii::Base.new
			puts a.asciify("Goodbye !!!")
			break
		end

	end
end
