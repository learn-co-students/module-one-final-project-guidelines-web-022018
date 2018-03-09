class Character < ActiveRecord::Base
  #has_many :comics
  has_many :creators, through: :creator_characters
  #has_many :series
  has_many :events, through: :event_characters
  has_many :event_characters
  has_many :creator_characters
  has_many :character_comics
  has_many :comics, through: :character_comics
end
