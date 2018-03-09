class Nominee < ActiveRecord::Base

  has_many :nominations
  has_many :movies, through: :nominations
  
end
