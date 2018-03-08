require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

connection = ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/students.sqlite"
)
