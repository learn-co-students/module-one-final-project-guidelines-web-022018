class CreatorComic < ActiveRecord::Base
  belongs_to :creator
  belongs_to :comic
end
