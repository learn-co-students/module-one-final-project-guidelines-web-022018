require 'bundler'
Bundler.require
require 'rspotify'
require 'pry'

require_relative '../app/models/artist'
require_relative '../app/models/genre'
require_relative '../app/models/track'
require_relative '../app/models/user'
require_relative '../app/models/adapter'

RSpotify.authenticate("2bddb2de8f6b4b7792f99cdb8aecbe19", "a5f9a55ab0db42f68a3c02cdab76fb61")

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
