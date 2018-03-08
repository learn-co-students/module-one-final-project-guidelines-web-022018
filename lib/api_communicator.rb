class ApiCommunicator
  def self.query(queryhash={})
    url = "https://api.punkapi.com/v2/beers?"
    beerlist = RestClient.get(url, {params: {hops:"cascade"}})
    beerarray = JSON(beerlist)
    beerarray.map {|beer| Beer.create({:beername=>beer["name"],:abv=>beer["abv"],:ibu=>beer["ibu"],:srm=>beer["srm"]})}
  end
end
