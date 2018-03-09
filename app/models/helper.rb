class Helper

  attr_reader :user
  attr_accessor :args, :inputs

  def initialize(user)
    @user = user
  end

  def self.get_input(type)
    output = []
    loop do
      puts ColorizedString["Please enter #{type} name."].colorize(:blue)
      puts ColorizedString["Type 'next' to continue. Or exit to return "].colorize(:light_blue)
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

  def get_amount
    puts ColorizedString["How many songs should I give you?"].colorize(:blue)
    input = gets.chomp
    begin
      Integer(input)
    rescue
      puts "Not a number"
      input = 30
    end
    if input.to_i > 100
      input = 100
    end
    input
  end

  def all_seed
    args = {artists: [], genres: [], tracks: []}
    args[:artists] = self.class.get_input('artist')
    return if !args[:artists]
    args[:genres] = self.class.get_input('genre')
    return if !args[:genres]
    args[:tracks] = self.class.get_input('track')
    return if !args[:tracks]
    amount = get_amount
    return Adapter.seed_format(args, amount, user)
  end

  def self.get_user
    loop do
      input = gets.chomp
      if User.all_users.include? input
        return User.find_by(name: input)
      else
        puts ColorizedString["User not found. Would you like to create a new profile? (Y/N)"].colorize(:red)
        y_n = gets.chomp.downcase
        case y_n
        when 'y'
          return User.create(name: input)
        else
          puts ColorizedString["Please enter a username."].colorize(:red)
        end
      end
    end
  end

end
