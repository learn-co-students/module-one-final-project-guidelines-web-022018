require_relative '../config/environment'

# binding.pry
a = Artii::Base.new
puts ColorizedString[a.asciify("Welcome to")].colorize(:light_green)
puts ColorizedString[a.asciify("Spotpandorify")].colorize(:light_green).blink
puts ColorizedString["Please enter a username."].colorize(:red)
input = gets.chomp
if User.all_users.include? input
  user = User.find_by(name: input)
else
  user = User.create(name: input)
  user.save
end
loop do
  puts ColorizedString["Logged in as #{user.name}. Please choose a function. Type 'help' for commands."].colorize(:magenta)
  input = gets.chomp
  case input.downcase
  when 'exit'
    break
  when 'recommendation'
    Helper.recommendation(user)
  when 'my artists'
    user.my_artists
  when 'my genres'
    user.my_genres
  when 'my tracks'
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
