class Genre < ActiveRecord::Base
  has_many :tracks
  has_and_belongs_to_many :users
end
