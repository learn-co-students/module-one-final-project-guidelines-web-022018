class PlayersStat < ActiveRecord::Base
  belongs_to :player
  belongs_to :game

end
