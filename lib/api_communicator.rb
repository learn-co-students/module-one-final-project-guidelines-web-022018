class ApiCommunicator
  def self.query(queryhash={})
    beerlist =[]
    page=1
    # queryhash.map {|x, y| self.send(("#{x}="), y)}
    url = "https://api.punkapi.com/v2/beers?"
    continue = true
    while page == 1
      beerconcat = RestClient.get(url, {params: {page: page}})
      beer_create(beerconcat)
      page += 1
    end
    while page > 1 && continue
      beerconcat = RestClient.get(url, {params: {page: page}})
      if beerconcat=="[]"
        continue=false
      else
        beer_create(beerconcat)
        page += 1
      end
    end
  Beer.all
  end
  def self.beer_create(beerlist)
    beerarray = JSON(beerlist)
    beerarray.map {|beer| Beer.create({:beername=>beer["name"],:abv=>beer["abv"],:ibu=>beer["ibu"],:srm=>beer["srm"]})}
  end
end
