class Helper
  def self.runtime(user)
    loop do
      puts "Logged in as #{user}. Please choose a function. Type 'help' for commands."
      input = gets.chomp
      case input.downcase
      when 'exit'
        break
      when 'recommendation'
        self.recommendation
      end
    end
  end

  def self.recommendation(user)
    puts 'I will generate suggestions based on your input.'
    puts 'Choose Artist, Genre, or Track.'
    input = gets.chomp
    case input.downcase
    when 'artist'
      self.generic_seed('artist', user)
    when 'genre'
      self.generic_seed('genre', user)
    when 'track'
      self.generic_seed('track', user)
    end
  end

  def self.generic_seed(type, user)
    array = []
    loop do
      puts "Please enter #{type} name."
      puts "Type 'done' to continue or 'exit' to return to the menu."
      input = gets.chomp
      case input.downcase
        when 'done'
          if array.length >= 1
            Adapter.send("#{type}_seed".to_sym, array, user)
            break
          else
            puts "You need to enter at least one #{type} to continue."
          end
        when 'exit'
          break
        else
          array << input.downcase
      end
    end
  end
end
