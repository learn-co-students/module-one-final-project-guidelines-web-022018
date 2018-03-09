# require_relative 'cli_search'
# require_relative 'trivia'
# require_relative 'random_fact'
# require 'pry'

def run
  puts `clear`
  start_award
  user_input = gets.downcase.strip
  puts
  if user_input == "search"
    run_search
  elsif user_input == "trivia"
    start_trivia
  elsif user_input == "random fact"
    random_fact
  elsif user_input == "exit"
    exit_award
  else puts "That's not a valid command. Please try again."
    sleep 1
    run
  end
end

def start_award
  puts "Welcome to the Academy Awards! What would you like to do?\n\n"
  puts "| Search | Trivia | Exit |\n\n"
end

def exit_award
  puts "Goodbye!"
end
