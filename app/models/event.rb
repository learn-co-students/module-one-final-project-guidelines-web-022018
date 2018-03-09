class Event < ActiveRecord::Base
  #has_many :comics
  has_many :creators, through: :event_creators
  has_many :characters, through: :event_characters
  ##has_many :series maybe has only one??
  has_many :event_characters
  has_many :event_creators
  has_many :event_comics
  has_many :comics, through: :event_comics
end
