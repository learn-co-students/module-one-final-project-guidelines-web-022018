class Game
  @@all = []

  def self.all
    @@all
  end

  def begin
    puts "Are you ready to play? (yes/no)"
  	response = gets.chomp.downcase
  	if response == "yes"
  		puts "Game is on!"
  		"Game is on!"
  		login
  	elsif response == "no"
  		puts "Fine, call your mommy."
  		"Fine, call your mommy."
  	else
  		puts "Invalid command. Please try again, loser." # this works!
			welcome  # this works!
  	end
  end

  def login
    puts "Enter your username: "
    username = gets.chomp.downcase
    if @@all.include?(username)
      puts "You already exist here. You are now logged in."
      "You already exist here. You are now logged in."
    else @@all << username
      #username = User.new(username)
      puts "You don't exist yet. User created."
      "You don't exist yet. User created."
    end
    new_move
  end

  def new_move
		puts "Enter your move: "
		@move = gets.chomp.downcase
    @computer = ['rock', 'paper', 'scissors'].sample
    if ['rock', 'paper', 'scissors'].include?(@move)
      puts @computer
      if @move == @computer
        puts "Draw. Go again."
        new_move
      else
        results
      end
    else
      puts "Invalid command. Learn the game, idiot!"
      new_move
    end
	end

  def results
    if (@move == "rock" && @computer == "scissors") ||
        (@move == "paper" && @computer == "rock") ||
        (@move == "scissors" && @computer == "paper")
        puts "You win. \n Play again? (yes/no)"
        response = gets.chomp.downcase
        if response == "yes"
          new_move
        else
          exit
        end
    elsif (@move == "scissors" && @computer == "rock") ||
        (@move == "paper" && @computer == "scissors") ||
        (@move == "rock" && @computer == "paper")
        puts "You lost, as expected. Get a life, loser! \n Play again? (yes/no)"
        response = gets.chomp.downcase
        if response == "yes"
          new_move
        else
          exit
        end
    end
  end
end
