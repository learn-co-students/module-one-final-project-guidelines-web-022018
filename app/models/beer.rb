class Beer < ActiveRecord::Base

   has_many :users, through: :favoriters

end



 # @@all=[]
 # def initialize(name,abv,ibu,srm)
 #   @name=name
 #   @abv=abv
 #   @ibu=ibu
 #   @srm=srm
 # end
 # def self.query
 #   url=“https://api.punkapi.com/v2/beers?”
 #   beerlist = RestClient.get(url,{params: {hops: ‘cascade’}})
 #   # size=beerlist.size
 #   # beerlist.map {|beer| @@all << objectizer(beer)}
 #   beerarray = JSON(beerlist)
 #   beerarraysize = beerarray.size
#    beerarray.map {|beer| @@all << (Beer.new(beer[“name”],beer[“abv”],beer[“ibu”], beer[“srm”]))}
#  end
#  def self.all
#    @@all
#  end
# end
