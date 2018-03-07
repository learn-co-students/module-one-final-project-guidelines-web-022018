class User < ActiveRecord::Base
  has_and_belongs_to_many :tracks
  has_and_belongs_to_many :artists
  has_and_belongs_to_many :genres

  def my_artists
    self.artists.collect do |a|
      puts a.name
      a.name
    end
  end

  def my_genres
    self.genres.collect do |a|
      puts a.name
      a.name
    end
  end

  def my_tracks
    self.tracks.collect do |a|
      puts a.name
      a.name
    end
  end
  
end
