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

  def self.get_input(type)
    output = []
    loop do
      puts "Please enter #{type} name."
      puts "Type 'next' to continue. Or exit to return "
      input = gets.chomp
      case input
      when 'next'
        break
      when 'exit'
        output = nil
        break
      else
        output << input.downcase
      end
    end
    output
  end

  def self.get_amount
    puts "How many songs should I give you?"
    input = gets.chomp
    begin
      Integer(input)
    rescue
      puts "Not a number"
      input = 30
    end
    input
  end

  def self.all_seed(user)
    args = {artists: [], genres: [], tracks: [], amount: 30}
    args[:artists] = self.get_input('artist')
    return if !args[:artists]
    args[:genres] = self.get_input('genre')
    return if !args[:genres]
    args[:tracks] = self.get_input('track')
    return if !args[:tracks]
    if args[:artists].empty? && args[:genres].empty? && args[:tracks].empty?
      puts "~~~"
      puts "Silence - Silence"
      puts "~~~"
      return
    end
    args[:amount] = self.get_amount
    Adapter.seed(args, user)
  end

end
