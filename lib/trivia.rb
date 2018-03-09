require 'pry'

def start_trivia
  puts `clear`
  puts "Welcome to the Academy Awards trivia! Are you ready to play? (y/n)\n\n"
  user_input = gets.downcase.strip
  if user_input == "y"
    puts `clear`
    question_one
  else
    puts
    puts "Goodbye!"
    run
  end
end

def question_one
  random_year = Nomination.all.map {|nom| nom.year}.uniq
  random_year = random_year[35..random_year.size].sample
  puts "Here is your first question:\n"
  puts "Which movie won Best Picture in #{random_year+1}?\n\n"
  user_input = gets.chomp
  answer = Movie.find(Nomination.all.where(year: random_year).where(category_name: "Best Picture").where(win: 1)[0].movie_id).name
  if user_input == answer
    puts "You are correct!\n\n"
    question_two
  elsif user_input == "exit"
    puts "Goodbye!"
    run
  else
    puts
    puts "Sorry! That is not correct. The right answer is:\n\n"
    puts answer
    puts
    puts "Would you like to continue? (y/n)\n\n"
    user_input2 = gets.downcase.strip
    if user_input2 == "y"
      puts `clear`
      question_two
    else
      puts `clear`
      run
    end
  end
end

def question_two
  puts `clear`
  random_year = Nomination.all.map {|nom| nom.year}.uniq
  random_year = random_year[49..random_year.size].sample
  puts "Here is your second question:\n"
  puts "Who won Best Actress in a Leading Role in #{random_year+1}?\n\n"
  user_input = gets.chomp
  if random_year < 1976
    answer = Nominee.find(Nomination.all.where(year: random_year).where(category_name: "Actress").where(win: 1)[0].nominee_id).name
  else
    answer = Nominee.find(Nomination.all.where(year: random_year).where(category_name: "Actress in a Leading Role").where(win: 1)[0].nominee_id).name
  end
  if user_input == answer
    puts "You are correct!"
    question_three
  elsif user_input == "exit"
    run
  else
    puts
    puts "Sorry! That is not correct. The right answer is:\n\n"
    puts answer
    puts
    puts "Would you like to continue? (y/n)\n\n"
    user_input2 = gets.downcase.strip
    if user_input2 == "y"
      puts `clear`
      question_three
    else
      puts `clear`
      run
    end
  end
end

def question_three
  random_year = Nomination.all.map {|nom| nom.year}.uniq
  random_year = random_year[49..random_year.size].sample
  puts "Here is your third question:\n"
  puts "Who won Best Actor in a Leading Role in #{random_year+1}?\n\n"
  user_input = gets.chomp
  if random_year < 1976
    answer = Nominee.find(Nomination.all.where(year: random_year).where(category_name: "Actor").where(win: 1)[0].nominee_id).name
  else
    answer = Nominee.find(Nomination.all.where(year: random_year).where(category_name: "Actor in a Leading Role").where(win: 1)[0].nominee_id).name
  end
  if user_input == answer
    puts "You are correct!"
    question_four
  elsif user_input == "exit"
    run
  else
    puts
    puts "Sorry! That is not correct. The right answer is:\n\n"
    puts answer
    puts
    puts "Would you like to continue? (y/n)\n\n"
    user_input2 = gets.downcase.strip
    if user_input2 == "y"
      puts `clear`
      question_four
    else
      puts `clear`
      run
    end
  end
end

def question_four
  random_year = Nomination.all.map {|nom| nom.year}.uniq
  random_year = random_year[9..random_year.size].sample
  puts "Here is your fourth question:\n"
  puts "Who won Best Actor in a Supporting Role in #{random_year+1}?"
  puts
  user_input = gets.chomp
  answer = Nominee.find(Nomination.all.where(year: random_year).where(category_name: "Actor in a Supporting Role").where(win: 1)[0].nominee_id).name
  if user_input == answer
    puts "You are correct!"
    question_five
  elsif user_input == "exit"
    run
  else
    puts
    puts "Sorry! That is not correct. The right answer is:\n\n"
    puts answer
    puts
    puts "Would you like to continue? (y/n)\n\n"
    user_input2 = gets.downcase.strip
    if user_input2 == "y"
      puts `clear`
      question_five
    else
      puts `clear`
      run
    end
  end
end

def question_five
  random_year = Nomination.all.map {|nom| nom.year}.uniq
  random_year = random_year[9..random_year.size].sample
  puts "Here is your last question:\n"
  puts "Who won Best Actress in a Supporting Role in (year)?"
  puts
  user_input = gets.chomp
  answer = Nominee.find(Nomination.all.where(year: random_year).where(category_name: "Actress in a Supporting Role").where(win: 1)[0].nominee_id).name
  if user_input == answer
    puts "You are correct!\n"
    puts "Thanks for playing!"
    run
  elsif user_input == "exit"
    run
  else
    puts "Sorry! That is not correct. The right answer is:\n\n"
    puts answer
    puts
    puts "Thanks for playing!"
    sleep 1
    run
  end
end

# def continue?(question)
#   binding.pry
#   puts
#   puts "Sorry! That is not correct. The right answer is:"
#   puts "Would you like to continue? (y/n)"
#   puts
#   user_input2 = gets.downcase.strip
#   if user_input2 == "y"
#     puts `clear`
#     question
#   else
#     puts `clear`
#     run
#   end
# end
