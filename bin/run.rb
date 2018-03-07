require_relative '../config/environment'

# binding.pry
a = Artii::Base.new
puts ColorizedString[a.asciify("Welcome to")].colorize(:light_green)
puts ColorizedString[a.asciify("Spotpandorify")].colorize(:light_green).blink
puts ColorizedString["Please enter a username."].colorize(:red)
user = nil
loop do
  input = gets.chomp
  if User.all_users.include? input
    user = User.find_by(name: input)
    break
  else
    puts ColorizedString["User not found. Would you like to create a new profile? (Y/N)"].colorize(:red)
    y_n = gets.chomp.downcase
    case y_n
    when 'y'
      user = User.create(name: input)
      user.save
      break
    else
      puts ColorizedString["Please enter a username."].colorize(:red)
    end
  end
end
loop do
  puts ColorizedString["Logged in as #{user.name}. Please choose a function. Type 'help' for commands."].colorize(:magenta)
  input = gets.chomp
  case input.downcase
  when 'exit'
    break
  when /recommend/
    Helper.all_seed(user)
  when /artist/
    user.my_artists
  when /genre/
    user.my_genres
  when /track/
    user.my_tracks
  when 'help'
    puts ColorizedString['Recommendation - Enter seeds to create recommendation playlist'].colorize(:white).on_red
    puts ColorizedString['My Artists - Display all artists you have saved to your profile'].colorize(:red).on_blue
    puts ColorizedString['My Genres - Display all genres you have saved to your profile'].colorize(:red).on_blue
    puts ColorizedString['My Tracks - Display all tracks you have saved to your profile'].colorize(:red).on_blue
    puts ColorizedString['Help - This menu'].colorize(:white).on_red
    puts ColorizedString['Exit - Quit the program'].colorize(:white).on_red
  else
    puts "Please enter a valid command"
  end
end

puts "Goodbye"
