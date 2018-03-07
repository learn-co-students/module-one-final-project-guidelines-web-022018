require 'pry'
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
  		login
  	elsif response == "no"
  		puts "Fine, call your mommy."
  	else
  		puts "Invalid command. Please try again, loser."
			begin
  	end
  end

  def login
    puts "Enter your username: "
    username = gets.chomp.downcase
    if @@all.include?(username)
      puts "You already exist here. You are now logged in."
    else @@all << username
      puts "You don't exist yet. We just created you."
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
    elsif @move == "fire"
      puts "You win everthing."
      exit
    else
      puts "Invalid command. Learn the game, idiot!"
      new_move
    end
	end

  def results
    if (@move == "rock" && @computer == "scissors") ||
        (@move == "paper" && @computer == "rock") ||
        (@move == "scissors" && @computer == "paper")
        # push result to database
        puts "You win."
        # display player's record
        puts "Play again? (yes/no)"
        response = gets.chomp.downcase
        if response == "yes"
          new_move
        else
          exit
        end
    elsif (@move == "scissors" && @computer == "rock") ||
        (@move == "paper" && @computer == "scissors") ||
        (@move == "rock" && @computer == "paper")
        # push resul to database
        puts "You lost, as expected. Get a life, loser!"
        # display player's record
        puts "Play again? (yes/no)"
        response = gets.chomp.downcase
        if response == "yes"
          new_move
        else
          exit
        end
      end
    end
  end
end
