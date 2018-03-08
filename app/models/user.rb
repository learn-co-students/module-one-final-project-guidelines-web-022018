class User < ActiveRecord::Base
  has_and_belongs_to_many :tracks
  has_and_belongs_to_many :artists
  has_and_belongs_to_many :genres
  has_many :seeds

  def self.all_users
    self.all.collect do |u|
      u.name
    end
  end

  def my_seeds
    puts "~~~"
    self.seeds.each do |s|
      puts "Name: #{s.name}"
      if s.seed[:seed_artists]
        puts "  Artists:"
        s.seed[:seed_artists].each do |x|
          puts "    #{Artist.find_by(spot_id: x).name}"
        end
      end
      if s.seed[:seed_genres]
        puts "  Genres:"
        s.seed[:seed_genres].each do |x|
          puts "    #{x}"
        end
      end
      if s.seed[:seed_tracks]
        puts "  Tracks:"
        s.seed[:seed_tracks].each do |x|
          puts "    #{Track.find_by(spot_id: x).name}"
        end
      end
      puts "~~~"
    end
  end

  def seed_titles
    puts "~~~"
    self.seeds.each do |s|
      puts s.name
    end
    puts "~~~"
  end

  def my_artists
    puts "~~~"
    self.artists.collect do |a|
      puts "- #{a.name}"
      a.name
    end
  end

  def my_genres
    puts "~~~"
    self.genres.collect do |a|
      puts "- #{a.name}"
      a.name
    end
  end

  def my_tracks
    puts "~~~"
    self.tracks.collect do |a|
      puts "- #{a.name}"
      a.name
    end
  end

end
