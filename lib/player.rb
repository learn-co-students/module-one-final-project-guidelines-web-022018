class Player
  attr_accessor :username

  def initialize(username)
    @username = username
    User.create(:username => @username, :wins => 0, :losses => 0)
  end
end
