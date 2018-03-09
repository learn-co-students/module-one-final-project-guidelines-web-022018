require "pry"

def print_blurb(json)
  if json["data"]["results"][0]["resourceURI"].include?("creators")
    puts "\n#{json["data"]["results"][0]["fullName"]}, creator at Marvel Comics."
  elsif json["data"]["results"][0]["resourceURI"].include?("characters")
    puts "\n#{json["data"]["results"][0]["name"]}"
    puts json["data"]["results"][0]["description"]
  else
    puts "\n#{json["data"]["results"][0]["title"]}"
    puts json["data"]["results"][0]["description"]
  end
  puts "\n"
end

def validate_json(json)
  json["data"]["results"] == [] ? false : true
end

def seed_db(json, input)

  #-------Initial Object Construction-------

  inputhash = {"characters" => Character, "creators" => Creator, "events" => Event, "comics"=>Comic}
  klass = inputhash[input[0]]

  results = json["data"]["results"][0]
  relevant_results = ["id","title","name","fullName","comics","events","creators","series","characters","stories"]
  results = results.select{|key, val| relevant_results.include?(key)}
  if klass.find_by name: results[results.keys[1]] #record already exists
    input_object = klass.find_by name: results[results.keys[1]]
  else #make new record
    input_object = klass.new
    attributes = input_object.attributes

    input_object.name = results[results.keys[1]]
    input_object.send(attributes.keys[2] + "=",results["id"])
    input_object.save
  end

  #--------Relationship construction-------
  relationship_hash = {
    "characters" => {"events" => EventCharacter, "comics" => CharacterComic},
    "events" => {"creators" => EventCreator, "characters" => EventCharacter, "events" => EventComic},
    "creators" => {"events" => EventCreator, "comics" => CreatorComic}
  }

  results.each do |key, value|
    if relationship_hash[input[0]].keys.include?(key)
      value["items"].each do |resource_hash|
        klass = inputhash[key]
        if klass.find_by name: resource_hash["name"]
          new_obj = klass.find_by name: resource_hash["name"]
        else
          new_obj = klass.new
          new_obj.name = resource_hash["name"]

          attributes = new_obj.attributes
          new_obj.send(attributes.keys[2] + "=",resource_hash["resourceURI"].split("/").last)
          new_obj.save
        end

        relationship_class = relationship_hash[input[0]][key]
        new_rel = relationship_class.new
        new_rel.send(input_object.class.to_s.downcase + "_id=", input_object.id)
        new_rel.send(new_obj.class.to_s.downcase + "_id=", new_obj.id)
        new_rel.save
      end
    end
  end
end
