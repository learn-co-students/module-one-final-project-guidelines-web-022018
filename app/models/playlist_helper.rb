class PlaylistHelper

  attr_reader :user
  attr_accessor :selection

  def initialize(user, selection)
    @user = user
    @selection = selection
  end

  def self.choose_playlist(user)
    loop do
      puts "Please choose a playlist:"
      user.seed_titles
      input = gets.chomp.downcase
      if user.seeds.find_by(name: input)
        output = user.seeds.find_by(name: input)
        return self.new(user, output)
        # select_function(output, user)
      elsif input == "exit"
        break
      else
        puts ColorizedString["Please enter a valid playlist"].colorize(:red)
      end
    end
  end

  def add_input(type)
    arr = Helper.get_input(type)
    if arr.nil?
      return
    end
    arr.each do |x|
      begin
        out = Adapter.send("find_#{type}", x, user)
      rescue
        puts "Couldn't find result for #{x}"
      end
      selection.seed["seed_#{type.pluralize}".to_sym] << out[1]
      selection.objects["seed_#{type.pluralize}".to_sym] << out[0]
      binding.pry
      selection.save
    end
  end

  def add_selection
    loop do
      puts ColorizedString["What would you like to add?"].colorize(:blue)
      puts ColorizedString["Artists, Genres or Tracks"].colorize(:blue)
      input = gets.chomp.downcase
      case input
      when /art/
        add_input('artist')
      when /gen/
        add_input('genre')
      when /tra/
        add_input('track')
      when /ex/
        break
      end
    end
    selection.save
  end

  def select_function
    loop do
      puts ColorizedString["Please choose a function."].colorize(:blue)
      puts ColorizedString["Add, Display, Delete, Load, Exit"].colorize(:blue)
      input = gets.chomp.downcase
      case input
      when /add/
        add_selection
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
        begin
          Adapter.return_playlist(selection.seed, user)
        rescue => e
          puts ColorizedString["Sorry, playlist generation failed."].colorize(:red)
        end
      when /del/
        selection.destroy
        selection.save
      when /ex/
        return
      end
    end
  end

end
