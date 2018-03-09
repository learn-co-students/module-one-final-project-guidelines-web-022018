# Welcome to SpotRec

  SpotRec is a command line interface that gives you in-depth control over Spotify's recommendation and seeding algorithm. You can create seeded playlists, save and edit those playlists later, view and reload your stored tracks, artists, genres and playlists, and take those playlists online to convert into Spotify or YouTube playlists for your listening pleasure.

# Installation

  Make sure you run *bundle install* in the root directory of the application to load dependencies.

  Start the program from the root application directory with *ruby bin/run.rb*

# Instructions

  - Homepage
    - Recommend - Takes an input of several artists, genres and tracks and returns a curated playlist of song recommendations.
      *NOTE* Spotify's recommendation algorithm can be finnicky. If recommendation is failing, try cutting down your inputs.
      *ALSO* Extremely disparate inputs will make Spotify freak out. Beethoven and Kanye will probably spit an error.

    - Playlists - Loads up all playlists you have saved to your username
      - Add - Add additional inputs to the playlist
      - Display - Display current seeded inputs for the playlist
      - Load - Reload seed and return a new playlist from Spotify of your desired length
      - Delete - Delete playlist from the database

    - My Tracks / Genres / Artists - Displays all tracks, artists or genres you have used as seed inputs and have data stored locally for.

    - Help - Display all available commands

    - Exit - Quit the program
