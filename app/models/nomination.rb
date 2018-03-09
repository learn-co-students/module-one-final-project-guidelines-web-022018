class Nomination < ActiveRecord::Base

  belongs_to :nominee
  belongs_to :movie

end
