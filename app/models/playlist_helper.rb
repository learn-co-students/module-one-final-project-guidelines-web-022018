class PlaylistHelper
  def self.choose_playlist(user)
    output = nil
    loop do
      puts "Please choose a playlist:"
      user.seed_titles
      input = gets.chomp.downcase
      if user.seeds.find_by(name: input)
        output = user.seeds.find_by(name: input)
        return output
      elsif input == "exit"
        break
      else
        puts "Please enter a valid playlist"
      end
    end
    output
  end

  def self.add_input(selection, user)
    loop do
      puts "What would you like to add?"
      puts "Artists, Genres or Tracks"
      input = gets.chomp.downcase
      case input
      when /arti/
        arr = Helper.get_input('artist')
        arr.each do |x|
          selection.seed[:seed_artists] << Adapter.find_artist(x, user).spot_id
        end
      when /gen/
        arr = Helper.get_input('genre')
        arr.each do |x|
          selection.seed[:seed_genres] << x
        end
      when /tra/
        arr = Helper.get_input('track')
        arr.each do |x|
          selection.seed[:seed_tracks] << Adapter.find_track(x, user).spot_id
        end
      when /exit/
        break
      end
    end
    selection.save
  end

  def self.select_function(user)
    selection = self.choose_playlist(user)
    puts "Please choose a function."
    puts "Add, Delete, Load, Exit"
    input = gets.chomp.downcase
    case input
    when /add/
      self.add_input(selection, user)
    when /load/
      selection.seed[:limit] = Helper.get_amount
      Adapter.return_playlist(selection.seed, user)
    when /del/
      selection.destroy
      selection.save
    end
  end

end
