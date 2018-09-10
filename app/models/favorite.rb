class Favorite  < ActiveRecord::Base

    belongs_to :user
    belongs_to :beer
end

  #
  # def initialize(userid, beerid)
  #   @userid = userid
  #   @beeridarray  = []
  #   @beeridarray << beerid
  # end



# end
# require ‘pry’
# require ‘rest-client’
# require ‘json’
# require_relative ‘users.rb’
# require_relative ‘userbeers.rb’
# require_relative ‘beers.rb’
# class Run
#  user1=Users.new(“grayson”)
#
# end
# Run.new
