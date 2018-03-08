class Game

  def welcome
    puts "Are you ready to play? (yes/no)"
  	response = gets.chomp.downcase
  	if response == "yes"
  		puts "Game is on!"
  		login
  	elsif response == "no"
  		puts "Fine, call your mommy."
  	else
  		puts "Invalid command. Please try again, loser."
			welcome
  	end
  end

  def login
    puts "Enter your username: "
    @username = gets.chomp.downcase
    if Player.all.include?(@username)
      puts "You already exist here. You are now logged in."
    else @username = Player.new(@username)
      puts "You don't exist yet. We just created you."
    end
    new_move
  end

  def new_move
		puts "Enter your move: (rock/paper/scissors)"
		puts "Your move: #{@move = gets.chomp.downcase}"
    @computer = ['rock', 'paper', 'scissors'].sample
    if ['rock', 'paper', 'scissors'].include?(@move)
      puts "Computer: #{@computer}"
      if @move == @computer
        puts "Draw. Go again."
        new_move
      else
        results
      end
    elsif @move == "fire"
      puts "You have unlocked the Ultimate Question of Life, the Universe, and Everything.\nDo you want the Answer? (yes/no)"
      response = gets.chomp.downcase
      if response == "yes"
        puts "42"
      elsif response == "no"
        puts "You will die one day."
      end
      exit
    else
      puts "Invalid command. Learn the game, idiot!"
      new_move
    end
	end

  def prompt
    response = gets.chomp.downcase
    if response == "yes"
      new_move
    elsif response == "no"
      exit
    else
      puts "Invalid command. Learn the game, idiot! Play again? (yes/no)"
      prompt
    end
  end

  def results
    if (@move == "rock" && @computer == "scissors") ||
        (@move == "paper" && @computer == "rock") ||
        (@move == "scissors" && @computer == "paper")
        @username.wins += 1
        puts "You win. Play again? (yes/no)"
        prompt
    elsif (@move == "scissors" && @computer == "rock") ||
        (@move == "paper" && @computer == "scissors") ||
        (@move == "rock" && @computer == "paper")
        @username.losses += 1
        puts "You lost, as expected. Get a life, loser!\nOr perhaps play again? (yes/no)"
        prompt
    end
  end
end
