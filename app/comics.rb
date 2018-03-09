class Comics < ActiveRecord::Base
  belongs_to :series
  has_many :creators
  has_many :characters
  has_many :events
end
