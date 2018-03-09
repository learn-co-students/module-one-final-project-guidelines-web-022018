
require 'pry'


def run_search
  search_options
  user_input = gets.downcase.strip
  if user_input == "name"
    name_search
  elsif user_input == "movie"
    movie_search
  elsif user_input == "year"
    year_search
  elsif user_input == "category"
    category_search
  elsif user_input == "main menu"
    run
  elsif user_input == "exit"
    exit_award
  else puts "That's not a valid command. Please try again."
    run_search
  end
end

def name_search
  puts
  puts "What name would you like to search for?\n\n"
  user_input = gets.chomp
  puts
  all_names = Nominee.all.map {|nom| nom.name}
  if all_names.include?(user_input)
    n_print_wins(user_input)
    run_search
  else
    puts "Please enter a valid name. Would you like to try again or exit?"
    user_input = gets.downcase.chomp
    if user_input == "try again"
      name_search
    else
      run_search
    end
  end
end

def movie_search
  puts
  puts "What movie would you like to search for?\n\n"
  user_input = gets.chomp
  puts
  all_movies = Movie.all.map {|m| m.name}
  if all_movies.include?(user_input)
    m_print_wins(user_input)
    run_search
  else
    puts "Please enter a valid movie. Would  you like to try again or exit?"
    user_input = gets.downcase.chomp
    if user_input == "try again"
      movie_search
    else
      run_search
    end
  end
end

# def winners
#   #all winners
#   run_search
# end

def year_search
  puts
  puts "What year (between 1927 - 2015) would you like to see?\n\n"
  user_input = gets.chomp.to_i
  puts
    if user_input.between?(1927,2015)
      awards_by_year(user_input)
      run_search
    else
      puts "That year is not in our database. Would you like to try again or exit?"
      user_input = gets.downcase.strip
      if user_input == "try again"
        year_search
      else
        run_search
      end
  end
end

def category_search
  puts
  puts "Please enter the category you would like to see:\n\n"
  all_categories = show_category
  all_categories.sort.each {|cat| puts "#{cat}\n"}
  puts
  user_input = gets.chomp
  puts
  if all_categories.include?(user_input)
    awards_by_category(user_input)
    run_search
  else
    puts "That category is not in our database. Would you like to try again or exit?"
    user_input = gets.downcase.strip
    if user_input == "try again"
      category_search
    else
      run_search
    end
  end
end

def show_category
  category = []
  Nomination.all.each do |nom|
    if category.include?(nom.category_name)
      next
    elsif nom.category_name.first == '"'
      next
    else
      category << nom.category_name
    end
  end
  category
end

def search_options
  puts "What would you like to search by?\n\n"
  puts "| Name | Movie | Year | Category | Main Menu | Exit |\n\n"
end
