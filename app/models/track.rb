class Track < ActiveRecord::Base
  belongs_to :artist
  has_many :genres
  has_and_belongs_to_many :users
end
