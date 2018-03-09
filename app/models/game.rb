class Game < ActiveRecord::Base
  has_many :players_stats
  has_many :players, through: :players_statsrs
end
