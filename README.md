# What It Does

- Asks for a local username
- Stores tracks, genres and artists that the user likes OR uses as seeds
- Stores seed lists under user-defined names
- Returns seeded playlists in text format arranged by a metric that the user selects (Valence, Danceability, etc)
- Links to http://www.playlist-converter.net/#/ underneath the text so that users can convert the list into a Spotify playlist.

# Tables
- User Table
- Artist
- Track
- Genres
- Seed Arrays (needs to store type, array of inputs)

# Interface
- It should ask whether the user wants to call up a saved seed, create a new seed, or look at their saved tracks & artists
- If they want to create a new seed, it should ask whether they want to search by artist, genre, or track
  - Then it should ask for inputs of as many genre, artist or track names as the user wants
  - Then it should ask which of our five attributes is most important (Danceability, valence, etc)
  - Then it should ping the spotify API for an array of track results
  - Then it should sort by attribute
  - Then it should map through the array and return a plaintext list of Track - Artist
  - If they like this seed, it should prompt to save the seed with a name.
- If they want to use an old seed, it should perform a seed search based on a saved array and type.
- If they want info on a track, it should ping spotify servers for that track and provide a prompt to search for any metadata


```ruby
u = User.create("andrew")
a = Artist.create("bananaphone")

#u.artists will look at join table to grab artists associated with given user
# << add artist obj to user artists collection
u.artists << a
# persist changes in db with save
u.save

find_genre(RSpotify::Artist.search(track.artists[0].name)[0].genres[0])
```
