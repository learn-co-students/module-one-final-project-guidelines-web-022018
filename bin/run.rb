require "pry"
require_relative '../config/environment.rb'

# require_relative '../lib/game.rb'

puts "Welcome to Rock, Paper, Scissors!"
# binding.pry
game = Game.new
game.welcome
