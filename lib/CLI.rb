def welcome
  options = {"1" => "characters",
    "2" => "creators",
    "3" => "events",
    "Characters" => "characters",
    "Creators" => "creators",
    "Events" => "events"
  }

  puts "Welcome to the Marvel recommendation app."
  puts "Please choose which kind of object to search for: \n1: Characters\n2: Creators\n3:Events"
  type = gets.chomp
  while !options.keys.include?(type)
    "Please type 1, 2, or 3 and press return."
    type = gets.chomp
  end
  puts "Please enter a character to search for:"
  char = gets.chomp
  [options[type], char]
end
