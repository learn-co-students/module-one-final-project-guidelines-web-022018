require_relative '../config/environment'

# binding.pry

puts "Hello, and welcome to Spotpandorify."
puts "Please enter a username."
input = gets.chomp
if User.all_users.include? input
  user = User.find_by(name: input)
else
  user = User.create(name: input)
  user.save
end
loop do
  puts "Logged in as #{user.name}. Please choose a function. Type 'help' for commands."
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
    puts 'Recommendation - Enter seeds to create recommendation playlist'
    puts 'My Artists - Display all artists you have saved to your profile'
    puts 'My Genres - Display all genres you have saved to your profile'
    puts 'My Tracks - Display all tracks you have saved to your profile'
    puts 'Help - This menu'
    puts 'Exit - Quit the program'
  else
    puts "Please enter a valid command"
  end
end

puts "Goodbye"
