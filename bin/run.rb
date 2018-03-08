require './config/environment'
require 'pry'
require './bin/splash'

def list_commands
  commands = <<-TEXT

    Type 'quit' to leave program
    --------------------------
    1.  List All Directors
    2.  List All Movies from a Director
    3.  List All Movie Genres from a Director
    4.  List Director with the Most Movies
    5.  List Movies by Director and Genre
    --------------------------
    6.  List All Countries that have Movies on the List
    7.  List All Movies from a Country
    --------------------------
    8.  List All Movies that Won Oscars
    9.  List Movie with Most Oscars
    10. List Oscars by Country
    --------------------------
    11. List All Movies
    12. List Movies from a Year
    13. List Movies from a Range of Years
    14. List Info about a Movie
    --------------------------
    15. List All Genres
    16. List All Movies from a Genre
    17. List Genre with the Most Movies
    18. List All Actors for a Genre
    --------------------------
    19. List All Actors
    20. List All of an Actor's Movies
    21. List All of a Movie's Actors
    22. List All Genres for Actor
    23. List Actor with the Most Movies

    TEXT
  puts commands
end

def do_command(entry=nil)
  case entry
  when "1"
    puts ""
    puts Director.print_director_names
  when "2"
    print "Please enter a director: "
    director_name = gets.chomp
    puts ""
    Director.print_list_of_movies_by_director(director_name)
  when "3"
    print "Please enter director name:"
    name = gets.chomp
    puts ""
    Director.print_genres_of_movies_by_director(name)
  when "4"
    puts ""
    Director.print_director_with_most_movies
  when "5"
    print "Please enter director name: "
    dir_name = gets.chomp
    print "Please enter genre name: "
    genre = gets.chomp
    puts ""
    puts Movie.movies_by_director_and_genre(dir_name, genre)
  when "6"
    puts ""
    Movie.print_list_of_countries
  when "7"
    print "Please enter country name: "
    name = gets.chomp
    puts ""
    Movie.print_list_movies_from_a_country(name)
  when "8"
    puts ""
    Movie.print_have_won_oscars
  when "9"
    puts ""
    puts Movie.movie_with_most_oscars_won[0].name + ", " + Movie.most_oscars_won.to_s
  when "10"
    puts ""
    Movie.oscars_by_country
  when "11"
    puts ""
    Movie.movie_names
  when "12"
    print "Please enter year: "
    year = gets.chomp
    puts ""
    Movie.movies_within_single_year(year)
  when "13"
    puts "Please enter a range of years."
    print "Enter the first year: "
    year1 = gets.chomp
    print "Enter the second year: "
    year2 = gets.chomp
    puts ""
    Movie.movies_within_year_range(year1, year2)
  when "14"
    print "Please enter a movie name: "
    movie_name = gets.chomp
    puts ""
    Movie.movie_info(movie_name)
  when "15"
    puts ""
    puts Genre.print_genre_names
  when "16"
    print "Please enter a genre: "
    genre_name = gets.chomp
    puts ""
    Genre.print_list_movies_from_genre(genre_name)
  when "17"
    puts ""
    Genre.print_genre_with_the_most_movies
  when "18"
    print "Please enter a genre: "
    genre_name=gets.chomp
    puts ""
    Genre.print_list_actors_from_genre(genre_name)
  when "19"
    puts ""
    Actor.print_list_of_all_actor_names
  when "20"
    print "Please enter an actor's name: "
    actor_name = gets.chomp
    puts ""
    Actor.print_get_actors_movie(actor_name)
  when "21"
    print "Please enter a movie: "
    movie_name = gets.chomp
    puts ""
    Movie.print_list_actors_in_movie(movie_name)
  when "22"
    print "Please enter actor name: "
    actor_name = gets.chomp
    puts ""
    Actor.print_list_genres_for_actor(actor_name)
  when "23"
    puts ""
    Actor.print_list_actor_with_the_most_movies
  else
    puts "Unable to comply, please check your input and try again."
  end
end



stay_in_app = true

while(stay_in_app) do
  puts "Here are a list of commands. What would you like to do?"
  list_commands #function
  print "Please enter a number or 'quit': "
  entry=gets.chomp
  if entry == "quit"
    stay_in_app = false
  else
    do_command(entry)
    puts "***********************************************************************"
    puts "Press enter to continue"
    waiting_on_user = gets.chomp
    Gem.win_platform? ? (system "cls") : (system "clear")
  end #if
end# while
puts "THANK YOU FOR USING THE DATABASE"
