require_relative '../config/environment'

#url = "http://gateway.marvel.com/v1/public/characters"
#url = "https://gateway.marvel.com:443/v1/public/characters/1009610/events?name=Age%20of%20Ultron"
url = get_api_URL(welcome)

response = RestClient.get(get_api_URL(url))
json = JSON.parse(response)
binding.pry
"hi"
