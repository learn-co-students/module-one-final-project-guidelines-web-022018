class PlaylistHelper
  def self.choose_playlist(user)
    loop do
      puts "Please choose a playlist:"
      user.seed_titles
      input = gets.chomp.downcase
      if user.seeds.find_by(name: input)
        output = user.seeds.find_by(name: input)
        select_function(output, user)
      elsif input == "exit"
        break
      else
        puts "Please enter a valid playlist"
      end
    end
  end

  def self.add_input(selection, type, user)
    arr = Helper.get_input(type)
    if arr.nil?
      return
    end
    arr.each do |x|
      begin
        out = Adapter.send("find_#{type}", x, user)[1]
      rescue
        puts "Couldn't find result for #{x}"
      end
      selection.seed["seed_#{type.pluralize}".to_sym] << out
    end
  end

  def self.add_selection(selection, user)
    loop do
      puts "What would you like to add?"
      puts "Artists, Genres or Tracks"
      input = gets.chomp.downcase
      case input
      when /art/
        add_input(selection, 'artist', user)
      when /gen/
        add_input(selection, 'genre', user)
      when /tra/
        add_input(selection, 'track', user)
      when /ex/
        break
      end
    end
    selection.save
  end

  def self.select_function(selection, user)
    loop do
      puts "Please choose a function."
      puts "Add, Display, Delete, Load, Exit"
      input = gets.chomp.downcase
      case input
      when /add/
        self.add_selection(selection, user)
      when /disp/
        puts ColorizedString["\n#{selection.name}:"].colorize(:black).on_white
        selection.objects.each do |k, v|
          out = k.to_s
          out.slice! "seed_"
          puts ColorizedString["\n  #{out}:"].colorize(:black).on_white
          v.each do |val|
            puts "    #{val.name}"
          end
        end
      when /load/
        selection.seed[:limit] = Helper.get_amount
        Adapter.return_playlist(selection.seed, user)
      when /del/
        selection.destroy
        selection.save
      when /ex/
        return
      end
    end
  end

end
