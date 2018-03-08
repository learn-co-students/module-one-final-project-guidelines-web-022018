require './app/models/helper.rb'

class Genre < ActiveRecord::Base
  extend Helper
  has_many :movies
  has_many :directors, through: :movies
  has_many :actors, through: :movies


  def self.genre_with_the_most_movies
    arr = self.all.sort{|a,b| a.movies.count <=> b.movies.count}
    high_count = arr.last.movies.count
    arr.map{|m| m.name if m.movies.count == high_count}.compact!
  end

  def self.print_genre_with_the_most_movies
    most_movies = self.genre_with_the_most_movies
    puts "There was a tie!" if most_movies.length > 1
    puts most_movies.sort!
  end

  def self.genre_names
    self.all.map { |g| g.name}.uniq.sort!
  end

  def self.print_genre_names
    puts self.genre_names
  end

  def self.list_movies_from_genre(name)
    if self.fnd(name)
      self.fnd(name).movies.map { |m| m.name}.sort!
    else
      self.suggestions(name)
    end
  end

  def self.print_list_movies_from_genre(genre)
    puts self.list_movies_from_genre(genre)
  end

  def self.list_actors_from_genre(genre)
    if self.fnd(genre)
      self.fnd(genre).actors.map{|a| a.name}.sort!
    else
      self.suggestions(genre)
    end
  end

  def self.print_list_actors_from_genre(genre)
    puts self.list_actors_from_genre(genre)
  end
end
