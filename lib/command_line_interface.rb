def welcome
  puts "Welcome to Beer Recipe Finder!"
end

def get_user
  puts "Please enter your name"
  user_id = gets.chomp
  user = User.find_or_create_by(name: user_id)
  user
  get_preferences(user)
end

def get_preferences(user)
  choices = {"1" => "Alcohol Content",
  "2" => "Darkness",
  "3" => "Clarity",
  "4" => "Bitterness"
  "Alcohol Content" => "abv",
  "Darkness" => "srm",
  "Clarity" => "ebc"
  "Bitterness" => "ibu"
}
  levels = {"1" => "Low",
    "2" => "Medium",
    "3" => "High",
    "Low" => "low",
    "Medium" => "medium",
    "High" => "high"
}
  if user.id == User.last.id
    puts "Please choose your preferences from the following options: \n1: Alcohol Content \n2: Darkness \n3: Clarity \n4: Bitterness"
    attribute = gets.chomp
    while choices.keys.include?(attribute)
      "Please type 1, 2, or 3 and press return."
       attribute = gets.chomp
       puts "Please enter an #{attribute} level:  \n1: Low \n2: Medium \n3: High"
       level = gets.chomp
      while levels.keys.include?(level)
        "Please type 1, 2, or 3 and press return."
        level = gets.chomp
      end
    end
  else
    puts "Welcome back, #{user.name}!"
    puts "Please choose your preferences from the following options:  \n1: Alcohol Content \n2: Darkness \n3: Clarity \n4: Bitterness"
    attribute = gets.chomp
    while choices.keys.include?(attribute)
      "Please type 1, 2, or 3 and press return."
      attribute = gets.chomp
      puts "Please enter a #{attibute}level: \n1: Low \n2: Medium \n3: High"
      level = gets.chomp
        while levels.keys.include?(level)
          "Please type 1, 2, or 3 and press return."
          level = gets.chomp
    end
  end
end
end
