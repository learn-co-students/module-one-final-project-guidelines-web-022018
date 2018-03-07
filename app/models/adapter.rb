class Adapter

  def self.find_artist(name, user)
    if !Artist.find_by(name: name)
      artist = RSpotify::Artist.search(name)[0]
      output = Artist.new(name: artist.name, spot_id: artist.id)
      output.save
      user.artists << output
      user.save
      return output
    else
      return Artist.find_by(name: name)
    end
  end

  def self.find_track(name, user)
    if !Track.find_by(name: name)
      track = RSpotify::Track.search(name)[0]
      output = Track.new(name: track.name, spot_id: track.id, artist_id: find_artist(track.artists[0].name, user).id, genre_id: genre_id_helper(track.artists[0].name, user))
      output.save
      user.tracks << output
      user.save
      return output
    else
      return Track.find_by(name: name)
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

  def self.seed(inputs, user)
    args = {}
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
    output = RSpotify::Recommendations.generate(args)
    output.tracks.each do |song|
      puts "#{song.artists[0].name} - #{song.name}"
    end
    nil
  end

end
