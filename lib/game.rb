class Game

	def new_move
		puts "Enter your move: "
		move = gets.chomp.downcase
		if move != "rock" && move != "paper" && move != "scissors"
			return "Invalid command. Learn the game, idiot!"
		end
	end

	

	
end