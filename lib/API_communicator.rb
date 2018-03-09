PUBLIC = "d4445ae4f53b3fbf9ea68b36c00d3dcf"
PRIVATE = "0b48f0bcc0187191ca63625229231eae37a6699f"

def get_timestamp
  Time.now.to_s.split("-").join.split(" ").join.split(":").join
end

def get_hash
  ts = get_timestamp
  string = ts + PRIVATE + PUBLIC
  [ts, Digest::MD5.hexdigest(string)]
end

def get_api_auth
  hash = get_hash
  "limit=100&ts=#{hash[0]}&apikey=#{PUBLIC}&hash=#{hash[1]}"
end

def get_api_search(input)
  type = input[0]
  search = input[1]#.split(" ").join("%20")

  if type == "creators"
    len = search.split(" ").length
    if len > 3
      puts "Sorry, too many names given"
      return
    elsif len == 3
      terms = {"firstName" => search.split(" ")[0], "middleName" => search.split(" ")[1], "lastName" => search.split(" ")[2]}
    elsif len == 2
      terms = {"firstName" => search.split(" ")[0], "lastName" => search.split(" ")[1]}
    else
      terms = {"lastName" => search}
    end
    search = ""
    terms.each do |keys, vals|
      search = search + keys + "=" + vals + "&"
    end
  else
    search = search.split(" ").join("%20")
    if search != ''
      #search = value_id[type] + "=" + search + "&"
      search = "name=" + search + "&"
    end
  end

  #value_id = {"characters" => "name", "creators" => "full name", "events" => "title"}


  "http://gateway.marvel.com/v1/public/#{type}?#{search}"
end

def get_api_URL(input)
  get_api_search(input) + get_api_auth
  # input + get_api_auth
end
