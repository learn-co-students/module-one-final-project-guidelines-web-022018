require_relative '../config/environment'

a = Artii::Base.new
colorizer = Lolize::Colorizer.new

welcome = a.asciify("Welcome to")
colorizer.write welcome
sleep(0.5)

spotrec = a.asciify("SpotRec")
colorizer.write(spotrec)
puts ""
sleep(0.5)

puts ColorizedString["\nPlease enter a username:"].colorize(:red)
user = Helper.get_user

# Chose to store the core program loop here. Not sure if this should've gone into its own class function or not.
# All actual functionality is stored elsewhere
# Helper is main CLI class
# Adapter handles Spotify queries
# PlaylistHelper handles modification of saved playlists
loop do
  puts ColorizedString["Logged in as #{user.name}. Please choose a function. Type 'help' for commands."].colorize(:magenta)
  input = gets.chomp
  case input.downcase
  when /ex/
    break
  when /rec/
    rec = Helper.new(user)
    dat = rec.all_seed
    begin
      Adapter.return_playlist(dat[0], user)
      Adapter.seed_saver(dat[0], dat[1], user)
    rescue
      puts ColorizedString["Sorry, playlist generation failed."].colorize(:red)
      puts ColorizedString["Perhaps your seed was too specific?"].colorize(:red)
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
      playlist_edit = PlaylistHelper.choose_playlist(user)
      playlist_edit.select_function
    end
  when /help/
    puts ColorizedString['Recommendation - Enter seeds to create recommendation playlist'].colorize(:white).on_red
    puts ColorizedString['Playlist - View, load and modify saved playlist seeds'].colorize(:white).on_red
    puts ColorizedString['My Artists - Display all artists you have saved to your profile'].colorize(:white).on_black
    puts ColorizedString['My Genres - Display all genres you have saved to your profile'].colorize(:white).on_black
    puts ColorizedString['My Tracks - Display all tracks you have saved to your profile'].colorize(:white).on_black
    puts ColorizedString['Help - This menu'].colorize(:white).on_red
    puts ColorizedString['Exit - Quit the program'].colorize(:white).on_red
  else
    puts "Please enter a valid command".blink
  end
end

puts ColorizedString["Goodbye!"].colorize(:red)
