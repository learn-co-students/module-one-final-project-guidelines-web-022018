class Adapter

  def self.find_artist(name, user)
    artists = Artist.arel_table
    if Artist.where(artists[:name].matches(name)).empty?
      artist = RSpotify::Artist.search(name)[0]
      if artist.nil?
        return nil
      end
      output = Artist.new(name: artist.name, spot_id: artist.id)
      output.save
      user.artists << output
      user.save
      return output
    else
      return Artist.where(artists[:name].matches(name))[0]
    end
  end

  def self.find_track(name, user)
    tracks = Track.arel_table
    if Track.where(tracks[:name].matches(name)).empty?
      track = RSpotify::Track.search(name)[0]
      if track.nil?
        return nil
      end
      output = Track.new(name: track.name, spot_id: track.id, artist_id: find_artist(track.artists[0].name, user).id, genre_id: genre_id_helper(track.artists[0].name, user))
      output.save
      user.tracks << output
      user.save
      return output
    else
      return Track.where(tracks[:name].matches(name))[0]
    end
  end

  def self.find_genre(name, user)
    if !Genre.find_by(name: name)
      genre = Genre.new(name: name)
      genre.save
      user.genres << genre
      user.save
      return genre
    else
      return Genre.find_by(name: name)
    end
  end

  def self.genre_id_helper(name, user)
    genre = RSpotify::Artist.search(name)[0].genres[0]
    if !genre.nil?
      output = find_genre(genre, user)
      output.id
    else
      nil
    end
  end

  def self.seed_saver(args, user)
    puts "Would you like to save this seed?"
    input = gets.chomp.downcase
    case input
    when /y/
      puts "Please enter a name"
      input = gets.chomp.downcase
      seed = Seed.new(name: input, seed: args, user_id: user.id)
      seed.save
      puts "Saved as #{input}"
    else
      return
    end
  end

  def self.return_playlist(args, user)
    output = RSpotify::Recommendations.generate(args)
    puts "~~~~~~"
    output.tracks.each do |song|
      puts "#{song.artists[0].name} - #{song.name}"
    end
    puts "~~~~~~"
    puts "Go here to convert your playlist: http://www.playlist-converter.net/#/"
  end

  def self.seed_format(inputs, user)
    args = {}
    begin
      if !inputs[:artists].empty?
        id_arr = inputs[:artists].collect do |a|
          find_artist(a, user).spot_id
        end
        args[:seed_artists] = id_arr
      end
      if !inputs[:genres].empty?
        args[:seed_genres] = inputs[:genres]
      end
      if !inputs[:tracks].empty?
        id_arr = inputs[:artists].collect do |t|
          find_track(t, user).spot_id
        end
        args[:seed_tracks] = id_arr
      end
      args[:limit] = inputs[:amount]
    rescue
      puts "~~ Your query could not be found ~~"
      puts "You may have misspelled title, or that content might not exist on Spotify."
      return
    end
    self.return_playlist(args, user)
    self.seed_saver(args, user)
  end

end
