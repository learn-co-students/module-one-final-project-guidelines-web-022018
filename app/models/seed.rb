class Seed < ActiveRecord::Base
  # Serialize is wonderful.
  serialize :seed, Hash
  serialize :objects, Hash
  belongs_to :user
end
