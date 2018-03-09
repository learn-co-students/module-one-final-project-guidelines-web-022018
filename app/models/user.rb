class User < ActiveRecord::Base
  has_many :favorites
  has_many :beers, through: :favorites
end

 # @@all=[]
 # def initialize(name)
 #   @name=name
 #   @@all << self
 # end
 # def query(query)
 #   beers = get_beers(query)
 # end
 # def self.all
 #   @@all
 # end
# end
