require_relative '../config/environment'

puts "Hello, and welcome to Spotpandorify."
puts "Please enter a username."
input = gets.chomp
if User.all_users.include? input
  user = User.find_by(name: input)
  binding.pry
else
  user = User.create(name: input)
  user.save
end
loop do
  puts "Logged in as #{user.name}. Please choose a function. Type 'help' for commands."
  input = gets.chomp
  case input.downcase
  when 'exit'
    break
  when 'recommendation'
    Helper.recommendation
  else
    puts "Please enter a valid command"
  end
end

alec = User.first

puts "Goodbye"
