require 'rspotify'
require 'pry'

RSpotify.authenticate("2bddb2de8f6b4b7792f99cdb8aecbe19", "a5f9a55ab0db42f68a3c02cdab76fb61")

binding.pry

artists = RSpotify::Artist.search('Arctic Monkeys')
