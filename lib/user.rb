class User
  attr_accessor :username
  @@all = []

  def self.all
    @@all
  end

  def initialize(username)
    @username = username
    @@all << self
  end
end
