class EventComic < ActiveRecord::Base
  belongs_to :event
  belongs_to :comic
end
