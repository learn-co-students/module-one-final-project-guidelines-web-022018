class Series < ActiveRecord::Base
  has_many :comics
  has_many :creators
  has_many :characters
  has_many :events
end
