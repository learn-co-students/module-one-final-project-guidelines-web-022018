require 'bundler'
Bundler.require
require 'rspotify'
require 'pry'
require 'colorize'
require 'colorized_string'
require 'artii'

require_relative '../app/models/artist'
require_relative '../app/models/genre'
require_relative '../app/models/track'
require_relative '../app/models/user'
require_relative '../app/models/seed'
require_relative '../app/models/adapter'
require_relative '../app/models/helper'
require_relative '../app/models/playlist_helper'

RSpotify.authenticate("2bddb2de8f6b4b7792f99cdb8aecbe19", "a5f9a55ab0db42f68a3c02cdab76fb61")

ActiveRecord::Base.logger.level = 1

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
