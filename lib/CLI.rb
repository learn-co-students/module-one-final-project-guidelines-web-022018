require 'pry'
def welcome
  puts `printf '\33c\e[3J'`
  options = {"1" => "characters",
    "2" => "creators",
    "3" => "events",
    "Characters" => "characters",
    "Creators" => "creators",
    "Events" => "events"
  }

  puts "Welcome to the Marvel recommendation app.\n \n"
  puts "Please choose which kind of object to search for:\n \n1: Characters\n \n2: Creators\n \n3: Events\n \n"
  type = gets.chomp
  puts `printf '\33c\e[3J'`
  type = type.split(" ").map{|word| word.capitalize}.join(" ")
  while !options.keys.include?(type)
    puts "Please choose which kind of object to search for:\n \n1: Characters\n \n2: Creators\n \n3: Events\n \n"
    type = gets.chomp
    type = type.split(" ").map{|word| word.capitalize}.join(" ")
    puts `printf '\33c\e[3J'`
  end
  #binding.pry
  "aeiou".split('').include?(options[type][0]) ? thingy = "n" : thingy = ""
  puts "Please enter a#{thingy} #{options[type][0..-2]} to search for:\n \n"
  search_term = gets.chomp
  search_term = search_term.split(" ").map{|word| word.capitalize}.join(" ")
  puts `printf '\33c\e[3J'`
  [options[type], search_term]
end

def cross_reference(first_input)
  options = {"1" => "characters",
    "2" => "creators",
    "3" => "events",
    "4" => false,
    "Characters" => "characters",
    "Creators" => "creators",
    "Events" => "events",
    "Just the first one is fine" => false
  }
  puts "Would you like to cross reference #{first_input[1]} with another type of Marvel Entity? \n \n"
  puts "1: Characters\n \n2: Creators\n \n3: Events\n \n4: Just the first one is fine\n \n"
  type = gets.chomp
  type = type.split(" ").map{|word| word.capitalize}.join(" ")
  puts `printf '\33c\e[3J'`
  while !options.keys.include?(type)
    puts "Please type 1, 2, 3 or 4 and press return.\n \n"
    type = gets.chomp
    type = type.split(" ").map{|word| word.capitalize}.join(" ")
    puts `printf '\33c\e[3J'`
  end
  if options[type]
    "aeiou".split('').include?(options[type][0]) ? thingy = "n" : thingy = ""
    puts "Please enter a#{thingy} #{options[type][0..-2]} to cross reference with #{first_input[1]}:\n \n"
    search_term = gets.chomp
    search_term = search_term.split(" ").map{|word| word.capitalize}.join(" ")
    puts `printf '\33c\e[3J'`
  else
    search_term = nil
  end
  [options[type], search_term]
end

def information_request(user_input)
  if user_input[0] == "characters"
    puts "\n"
    puts "Please select the number of a question:\n \n"
    puts "1. What were the major Marvel Universe events that #{user_input[1]} participated in?\n \n"
    puts "2. What were the issues that featured #{user_input[1]}?\n \n"
    choice = gets.chomp
    choices = {"1" => "events", "2" => "comics"}
    return choices[choice]
  elsif user_input[0] == "events"
    puts "\n"
    puts "Please select the number of a question:\n \n"
    puts "1. Which Marvel creators worked on #{user_input[1]}?\n \n"
    puts "2. Which Marvel characters participated in #{user_input[1]}?\n \n"
    puts "3. What issues make up #{user_input[1]}?\n \n"
    choice = gets.chomp
    choices = {"1" => "creators", "2" => "characters", "3" => "comics"}
    return choices[choice]
  elsif user_input[0]== "creators"
    puts "\n"
    puts "Please select the number of a question:\n \n"
    puts "1. Which Marvel events did #{user_input[1]} work on?\n \n"
    puts "2. Which issues did #{user_input[1]} work on?\n \n"
    choice = gets.chomp
    choices = {"1" => "events", "2" => "comics"}
    return choices[choice]
  else
    puts "Invalid input."
  end
end

def return_info(user_input, type_of_response)
  user_input[0].class == Array ? cross_ref = 1 : cross_ref = 0
  class_hash = {"characters" => Character, "creators" => Creator, "events" => Event, "comics" => Comic}

  if cross_ref == 0 #singular input to search by
    relationship_hash = {
      "characters" => {"events" => "#{user_input[1]} participated in the following events:\n \n",
                      "comics" => "#{user_input[1]} was featured in the following issues:\n \n"},
      "events" => {"creators" => "#{user_input[1]} was worked on by the following creators:\n \n",
                  "comics" => "#{user_input[1]} is made up of the following issues:\n \n",
                  "characters" => "#{user_input[1]} featured the following characters:\n \n"},
      "creators" => {"events" => "#{user_input[1]} worked on the following events:\n \n",
                    "comics" => "#{user_input[1]} worked on the following issues:\n \n"}
    }
    puts `printf '\33c\e[3J'`
    puts relationship_hash[user_input[0]][type_of_response]
    array = class_hash[type_of_response].all.map do |object|
      object.name + "\n \n"
    end
    puts array

  else #cross referencing two inputs
    a = class_hash[user_input[0][0]].find_by name: user_input[0][1] #first user object
    b = class_hash[user_input[1][0]].find_by name: user_input[1][1] #second user object
    puts "#{a.name} and #{b.name} have the following in common:\n \n"
    class_hash.keys.each do |attribute|
      begin #using begin/rescue to check all class/attribute combos without throwing errors when a combo doesnt exist
        a.send(attribute)
        b.send(attribute)
        commonalities = class_hash[attribute].all.select do |object|
          a.send(attribute).include?(object) && b.send(attribute).include?(object)
        end
        if commonalities != []
          puts "#{attribute.capitalize}:\n \n"
          commonalities.each_with_index{|common, i| puts "#{i+1}: #{common.name}\n \n"}
        end
      rescue
      end
    end
  end
end

def rerun
  puts "Would you like to perform another search? Y/N\n \n"
  new_search = gets.chomp
  puts printf `printf '\33c\e[3J'`
  new_search.downcase == "y"
end
