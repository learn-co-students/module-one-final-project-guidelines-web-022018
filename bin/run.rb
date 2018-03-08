require_relative '../config/environment'

binding.pry
a = Artii::Base.new
puts ColorizedString[a.asciify("Welcome to")].colorize(:light_green)
puts ColorizedString[a.asciify("SpotRec")].colorize(:light_green).blink
puts ColorizedString["Please enter a username."].colorize(:red)
user = Helper.get_user
loop do
  puts ColorizedString["Logged in as #{user.name}. Please choose a function. Type 'help' for commands."].colorize(:magenta)
  input = gets.chomp
  case input.downcase
  when /ex/
    break
  when /rec/
    dat = Helper.all_seed(user)
    begin
      Adapter.return_playlist(dat[0], user)
      Adapter.seed_saver(dat[0], dat[1], user)
    rescue
      puts "Sorry, playlist generation failed."
      puts "Perhaps your seed was too specific?"
    end
  when /art/
    user.my_artists
  when /gen/
    user.my_genres
  when /track/
    user.my_tracks
  when /play/
    if user.seeds.empty?
      puts "No playlists saved"
    else
      PlaylistHelper.select_function(user)
    end
  when /help/
    puts ColorizedString['Recommendation - Enter seeds to create recommendation playlist'].colorize(:white).on_red
    puts ColorizedString['Playlist - View, load and modify saved playlist seeds'].colorize(:white).on_red
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
