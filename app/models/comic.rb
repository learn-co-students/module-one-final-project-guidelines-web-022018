class Comic < ActiveRecord::Base
  #has_many :comics
  has_many :creators, through: :creator_comics
  #has_many :series
  has_many :events, through: :event_comics
  has_many :characters, through: :character_comics
  has_many :event_comics
  has_many :creator_comics
  has_many :character_comics
end
