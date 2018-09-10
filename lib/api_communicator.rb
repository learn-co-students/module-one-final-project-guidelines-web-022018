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
    beerarray.map {|beer| Beer.create({
      :apiid => beer["id"],
      :beername=>beer["name"],
      :tagline=>beer["tagline"],
      :description=>beer["description"],
      :abv=>beer["abv"],
      :ibu=>beer["ibu"],
      :target_fg=>beer["target_fg"],
      :target_og=>beer["target_og"],
      :srm=>beer["srm"],
      :ph=>beer["ph"],
      :attenuation_level=>beer["attentuation_level"],
      :volume=>beer["volume"].to_s,
      :boil_volume=>beer["boil_volume"].to_s,
      :method=>beer["method"].to_s,
      :ingredients=>beer["ingredients"].to_s,
      :food_pairing=>beer["food_pairing"].to_s,
      :brewers_tips=>["brewers_tips"],
      :contributed_by=>beer["contributed_by"]})}
  end
end
