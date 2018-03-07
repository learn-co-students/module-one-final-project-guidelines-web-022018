class Seed < ActiveRecord::Base
  serialize :seed, Hash
  belongs_to :user
end
