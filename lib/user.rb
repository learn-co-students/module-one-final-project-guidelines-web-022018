class User

	def welcome
		puts "Welcome to Rock Paper Scissors!\n Enter your username: "
		username = gets.chomp.downcase
		# if exists, user is logged in, otherwise user is created in database
		# return "User has been created. / User is logged in."
		# Are you ready to play? (yes/no)
		response = gets.chomp.downcase!
		if response == "yes"
			puts "Game is on, bitches!" #countdown
			start_game
		elsif response == "no"
			puts "Fine, call your mommy."
			exit_game
		else
			puts "Invalid command. Please try again, loser."
			welcome
		end
	end

	# def self.move(blah)
	# 	bla = Move.new(blah)
	# end

	# def exit_game
	# 	exit
	# end

end