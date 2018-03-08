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
    if find_user
      puts "You already exist here. You are now logged in."
    else Player.new(@username)
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
      view_score
    else
      puts "Invalid command. Learn the game, idiot! Play again? (yes/no)"
      prompt
    end
  end

  def view_score
    puts "Would you like to see your score? (yes/no)"
    answer = gets.chomp.downcase
    if answer == "yes"
      user = find_user
      puts "#{user.wins} wins and #{user.losses} losses."
      delete
    elsif answer == "no"
      puts "Go away, don't come back!"
      exit
    else
      puts "Invalid command. Learn to read."
      view_score
    end
  end

  def delete
    puts "Feeling depressed with your crappy score? Delete yourself. (yes/no)"
    response = gets.chomp.downcase
    if response == "yes"
      user = find_user
      user.delete
      puts "Alright, see you never!"
    elsif response == "no"
      puts "Peace."
      exit
    else
      puts "Invalid command. Learn to read."
      delete
    end
  end

  def results
    if (@move == "rock" && @computer == "scissors") ||
        (@move == "paper" && @computer == "rock") ||
        (@move == "scissors" && @computer == "paper")
        update_wins
        puts "You win. Play again? (yes/no)"
        prompt
    elsif (@move == "scissors" && @computer == "rock") ||
        (@move == "paper" && @computer == "scissors") ||
        (@move == "rock" && @computer == "paper")
        update_losses
        puts "You lost, as expected. Get a life, loser!\nOr perhaps play again? (yes/no)"
        prompt
    end
  end

  def find_user
    User.find_by(username: @username)
  end

  def update_wins
    user = find_user
    user.wins += 1
    user.save
  end

  def update_losses
    user = find_user
    user.losses += 1
    user.save
  end
end
