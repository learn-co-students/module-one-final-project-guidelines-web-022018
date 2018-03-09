require 'bundler'
Bundler.require
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'app'
require_all 'lib'
require 'csv'
require 'artii'

old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil
a = Artii::Base.new
