# Marvel Recommendation Ap

# Introduction and Overview
The Marvel Recommendation App (MRA) is a CLI that enables the user to ask questions of the Marvel Comics' official API (https://developer.marvel.com/). The MRA prompts the user to enter a Marvel character, creator or event that he or she would like to know about. It then employs RestClient to pull the pertinent information from the database, parses it with JSON, and creates join tables between relevant API entities (characters, creators, events, and comics) using ActiveRecord. The user can then access information from these other entities - for example, pulling all of the Marvel events that Wolverine participated in. The MRA also allows for cross-referencing in the initial search, to find overlap in the database between two separate entity objects - for example, the user can pull information for both Iron Man and Captain America, and return the events in which both characters participated. Finally, in character searches, the MRA uses the MiniMagick gem to create ASCII representations of character thumbnails pulled from the API.

# Prerequisites
The MRA requires Sinatra, RestClient, JSON, ActiveRecord, Rake and MiniMagick. Relevant gems are stored in the Gemfile, run "bundle install" to acquire them.  

#Built With
Atom - text/source code editor
Marvel Developer API

# Authors
Dan Baamonde - API querying, object creation/relationships and ASCII art generation  
Chris Jacobs - CLI interaction

# Demo Video
https://www.youtube.com/watch?v=J7JGIdbjYIM

# License
This project is licensed under the MIT License - see the LICENSE.md file for details
