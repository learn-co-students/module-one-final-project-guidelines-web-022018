require_relative '../config/environment.rb'

def find_artist(name)
  if !Artist.find_by(name: name)
    artist = RSpotify::Artist.search(name)[0]
    output = Artist.new(name: artist.name, spot_id: artist.id)
    output.save
    return output
  else
    return Artist.find_by(name: name)
  end
end

def find_track(name)
  if !Track.find_by(name: name)
    track = RSpotify::Track.search(name)[0]
    output = Track.new(name: track.name, spot_id: track.id, artist_id: find_artist(track.artists[0].name).id, genre_id: genre_id_helper(track.artists[0].name))
    output.save
    return output
  else
    return Track.find_by(name: name)
  end
end

def find_genre(name)
  if !Genre.find_by(name: name)
    genre = Genre.new(name: name)
    genre.save
    return genre
  else
    return Genre.find_by(name: name)
  end
end

def genre_id_helper(name)
  genre = RSpotify::Artist.search(name)[0].genres[0]
  if !genre.nil?
    output = find_genre(genre)
    output.id
  else
    nil
  end
end

binding.pry
puts "bye"
