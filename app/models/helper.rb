module Helper
  def suggestions(name)
    output = "Sorry, #{name} not found."
    matches = self.all.where("name LIKE ?", "%#{name}%").map{ |m| m.name }.sort!
    matches.length > 0 ? output + " Try: " + matches.join(', ') : output
  end

  def fnd(name)
    self.all.where("lower(name) == ?",name.downcase)[0]
  end
end
