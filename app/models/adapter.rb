class Adapter

  def self.find_artist(name, user)
    artists = Artist.arel_table
    if Artist.where(artists[:name].matches(name)).empty?
      artist = RSpotify::Artist.search(name)[0]
      if artist.nil?
        return nil
      end
      output = Artist.create(name: artist.name, spot_id: artist.id)
      user.artists << output
      user.save
    else
      output = Artist.where(artists[:name].matches(name))[0]
    end
    return [output, output.spot_id]
  end

  def self.find_track(name, user)
    tracks = Track.arel_table
    if Track.where(tracks[:name].matches(name)).empty?
      track = RSpotify::Track.search(name)[0]
      if track.nil?
        return nil
      end
      artist = find_artist(track.artists[0].name, user)[0]
      output = Track.create(name: track.name,
        spot_id: track.id,
        artist_id: artist.id,
        genre_id: genre_id_helper(artist, user),
        acousticness: track.audio_features.acousticness,
        danceability: track.audio_features.danceability,
        energy: track.audio_features.energy,
        instrumentalness: track.audio_features.instrumentalness,
        valence: track.audio_features.valence,
        tempo: track.audio_features.tempo,)
      user.tracks << output
      user.save
    else
      output = Track.where(tracks[:name].matches(name))[0]
    end
    return [output, output.spot_id]
  end

  def self.find_genre(name, user)
    if !Genre.find_by(name: name)
      genre = Genre.new(name: name)
      genre.save
      user.genres << genre
      user.save
    else
      genre = Genre.find_by(name: name)
    end
    return [genre, genre.name]
  end

  def self.genre_id_helper(artist, user)
    genre = RSpotify::Artist.search(artist.name)[0].genres[0]
    if !genre.nil?
      output = find_genre(genre, user)[0]
      output.id
    else
      nil
    end
  end

  def self.seed_saver(seed, objects, user)
    puts "Would you like to save this seed?"
    input = gets.chomp.downcase
    case input
    when /y/
      puts "Please enter a name"
      input = gets.chomp.downcase
      seed = Seed.create(name: input, seed: seed, objects: objects, user_id: user.id)
      puts "Saved as #{input}"
    else
      return
    end
  end

  def self.return_playlist(args, user)
    output = RSpotify::Recommendations.generate(args)
    puts "~~~~~~"
    output.tracks.each do |song|
      colorizer = Lolize::Colorizer.new
      list = ("\n#{song.artists[0].name} - #{song.name}")
      colorizer.write(list)
    end
<<<<<<< HEAD
    puts "\n~~~~~~"
=======
    puts "~~~~~~"
    puts "Go here to convert your playlist: http://www.playlist-converter.net/#/"
>>>>>>> master
  end

  def self.seed_format(inputs, amount, user)
    args = {limit: amount.to_i}
    objs = {}
    inputs.each do |hash, key|
      arg_arr = []
      obj_arr = []
      key.each do |k|
        begin
          filtered = self.send("find_#{hash.to_s.singularize}".to_sym, k, user)
          arg_arr << filtered[1]
          obj_arr << filtered[0]
        rescue
          puts "Couldn't find #{hash} query #{k}"
        end
      end
      objs["seed_#{hash}".to_sym] = obj_arr
      args["seed_#{hash}".to_sym] = arg_arr
    end
    [args, objs]
  end
end
