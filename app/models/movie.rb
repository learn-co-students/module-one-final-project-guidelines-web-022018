class Movie < ActiveRecord::Base

  has_many :nominations
  has_many :nominees, through: :nominations

end
