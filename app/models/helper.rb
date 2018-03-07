class Helper
  def self.runtime
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

  def self.recommendation
    puts 'I will generate suggestions based on your input.'
    puts 'Choose Artist, Genre, or Track.'
    a_array = []
    input = gets.chomp
    case input.downcase
    when 'artist'
      loop do
        puts "Please enter an artist name."
        puts "Type 'done' to continue or 'exit' to return to the menu."
        input = gets.chomp
        case input.downcase
          when 'done'
            if a_array.length >= 1
              Adapter.artist_seed(a_array, user)
              break
            else
              puts "You need to enter at least one artist to continue."
            end
          when 'exit'
            break
          else
            a_array << input
        end
      end
    end
  end
end
