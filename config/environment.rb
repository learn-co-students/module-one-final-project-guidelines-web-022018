require 'bundler/setup'
Bundler.require

require 'rake'
require 'active_record'
require 'yaml/store'
require 'ostruct'
require 'date'




ActiveRecord::Base.establish_connection(
 :adapter => "sqlite3",
 :database => "db/users.sqlite"
)

# put the code to connect to the database here
# require_relative "../db/migrate/create_users.rb"
require_relative "../USER.rb"
require_all 'lib'
