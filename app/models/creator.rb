class Creator < ActiveRecord::Base
  #has_many :comics
  #has_many :series
  has_many :characters, through: :creator_characters
  has_many :events, through: :event_creators
  has_many :event_creators
  has_many :creator_characters
  has_many :creator_comics
  has_many :comics, through: :creator_comics
end
