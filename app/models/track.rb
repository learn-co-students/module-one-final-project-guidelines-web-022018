class Track < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_and_belongs_to_many :users
end
