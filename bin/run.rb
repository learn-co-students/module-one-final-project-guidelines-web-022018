require_relative '../config/environment'

char = welcome
url = get_api_URL(char)
puts url

response = RestClient.get(url)

json = JSON.parse(response)
binding.pry
"hi"
