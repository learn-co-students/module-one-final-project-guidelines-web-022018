require_relative '../config/environment.rb'

def find_artist(name, user)
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

def find_track(name, user)
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

def find_genre(name, user)
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

def genre_id_helper(name, user)
  genre = RSpotify::Artist.search(name)[0].genres[0]
  if !genre.nil?
    output = find_genre(genre, user)
    output.id
  else
    nil
  end
end

def genre_seed(arr, user)
  objects = arr.collect do |g|
    find_genre(g, user).name
  end
  output = RSpotify::Recommendations.generate(seed_genres: objects)
  output.tracks.each do |song|
    puts "~~~~~~~"
    puts "#{song.artists[0].name} - #{song.name}"
    puts "~~~~~~~"
  end
  puts nil
end

def artist_seed(arr, user)
  id_arr = arr.collect do |a|
    find_artist(a, user).spot_id
  end
  output = RSpotify::Recommendations.generate(seed_artists: id_arr)
  output.tracks.each do |song|
    puts "~~~~~~~"
    puts "#{song.artists[0].name} - #{song.name}"
    puts "~~~~~~~"
  end
  puts nil
end

def track_seed(arr, user)
  output = RSpotify::Recommendations.generate(seed_tracks: arr.map{ |t| t.spot_id})
  output.tracks.each do |song|
    puts "~~~~~~~"
    puts "#{song.artists[0].name} - #{song.name}"
    puts "~~~~~~~"
  end
  puts nil
end

binding.pry
puts "bye"
