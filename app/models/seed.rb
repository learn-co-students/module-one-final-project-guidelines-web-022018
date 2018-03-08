class Seed < ActiveRecord::Base
  serialize :seed, Hash
  serialize :objects, Hash
  belongs_to :user
end
