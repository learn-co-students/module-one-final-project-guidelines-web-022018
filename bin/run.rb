require_relative '../config/environment'
require_relative '../lib/json_parsing'
require_relative '../lib/ASCII'
new_search = true

while new_search
  user_input = welcome
  url = get_api_URL(user_input)

  response = RestClient.get(url)
  json = JSON.parse(response)

  if validate_json(json) #checks that the thing you searched exists

    seed_db(json, user_input)

    print_blurb(json)
    if user_input[0] == "characters"
      path = get_path(json)
      if path
        img = MiniMagick::Image.open(path)
        convert_to_ascii(img,5)
        puts "\n"
      end
    end

    secondary_input = cross_reference(user_input)

    if secondary_input[0] #gonna cross reference stuff
      secondary_url = get_api_URL(secondary_input)

      secondary_response = RestClient.get(secondary_url)
      secondary_json = JSON.parse(secondary_response)

      if validate_json(secondary_json)
        seed_db(secondary_json, secondary_input)

        combined_info = [user_input, secondary_input]
        return_info(combined_info, nil)
      else
        puts "#{secondary_input[1]} could not be found"
      end

    else #not gonna cross reference stuff
      type_of_response = information_request(user_input)
      return_info(user_input, type_of_response)
    end
  else
    puts "#{user_input[1]} could not be found"
  end
  new_search = rerun
end

puts "Goodbye! \n \n"
