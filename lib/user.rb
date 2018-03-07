class User
  @@all = []

  def self.all
    @@all
  end

  def initialize(username)
    @username = username
    @@all << self
  end
end
