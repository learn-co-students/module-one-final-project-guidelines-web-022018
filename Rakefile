require_relative 'config/environment'
require 'sinatra/activerecord/rake'
require "csv"

desc 'starts a console'
task :console do
  Pry.start
end

namespace :import do
  desc "Import films from CSV"
  task :films  do
    CSV.foreach("./films2.csv", headers: true) do |row|
      director = Director.find_or_create_by(name: row['Director'].strip)
      genre = Genre.find_or_create_by(name: row['Genre'])
      m = Movie.create(
        name: row['Film'].strip,
        genre_id: genre.id,
        director_id: director.id,
        year: row['Year of cinema release'],
        oscars: row['Oscars won'],
        country: row['Country']
      )
      row['Leading actors'].strip.chomp('"').split(',').each do |actor_name|
        a = Actor.find_or_create_by(
          name: actor_name.strip
        )
        a.movies << m
      end
    end
  end
end
