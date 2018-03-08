class Player
  attr_accessor :username, :wins, :losses
  @@all = []

  def self.all
    @@all
  end

  def initialize(username)
    @username = username
    @wins = 0
    @losses = 0
    @@all << self
  end
end
