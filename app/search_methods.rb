# Define the methods for the CLI here
require 'pry'

#Retrieve Nominee entries matching the (name) entered by the User.
def n_occurances(name)
  Nominee.all.where(name: name).first
end

#Retreive all winning nominations for (name)
def n_all_wins(name)
  times_won = n_occurances(name).nominations.where(win: 1)
end

#Retrieve all winning nomination category names for (name)
def n_all_wins_categories(name)
  win_nom_cats = n_all_wins(name).map {|nomination| nomination.category_name}
end

#Retrieve all unique awards
def n_uniq_wins(name)
  n_all_wins_categories(name).uniq
end

#Format wins and nominations into output to User
def n_print_wins(name)
  string = ""
  string2 = ""
  awc = n_all_wins_categories(name)
  uw = n_uniq_wins(name)
  no = n_occurances(name)
  uw.each do |win|
    string = string + "Best #{win} #{awc.count(win)} time(s)\n"
  end
  n_occurances(name).movies.each {|movie| string2 << "#{movie.name} (#{Nomination.all.where(movie: movie.id).take.year})\n"}
  puts "#{name} has been nominated #{no.nominations.size} time(s) and has won #{awc.size} time(s)."
  puts
  puts "#{name} has won the awards for:"
  puts
  puts string
  puts
  puts "His/her list of nominated movies includes:"
  puts
  puts string2
  puts
end

#Retrieve all Movie entries matching the (name) entered by the User.
def m_occurances(name)
  Movie.all.where(name: name).first
end

#Retreive all winning nominations for (name)
def m_all_wins(name)
  times_won = m_occurances(name).nominations.where(win: 1)
end

#Retrieve all winning nomination category names for (name)
def m_all_wins_categories(name)
  win_nom_cats = m_all_wins(name).map {|nomination| nomination.category_name}
end

#Retrieve all unique awards
def m_uniq_wins(name)
  m_all_wins_categories(name).uniq
end

#Format wins and nominations into output to User
def m_print_wins(name)
  string = ""
  awc = m_all_wins_categories(name)
  uw = m_uniq_wins(name)
  mo = m_occurances(name)
  uw.each do |win|
    string = string + "Best #{win}\n"
  end
  puts "#{name} has been nominated #{mo.nominations.size} time(s) for an Academy Award and has won #{awc.size} time(s)."
  puts
  puts "#{name} has won the awards for:"
  puts
  puts string
  puts
end

#List all Academy award winners during the year specified by the User.
def awards_by_year(year)
  string = ""
  nom_array = Nomination.all.where(year: year-1).where(win: 1)
  nom_array.each {|nom| string = string + "#{nom.category_name}: #{Nominee.all.find(nom.nominee_id).name}\n"}
  puts "The #{year} Academy Award winners were:"
  puts
  puts string
  puts
end

#Create suffix for formatting ceremony in output
def suffix_find(ceremony_name)
  array = ceremony.to_s.split("")
  if array.last == "1"
    "st"
  elsif array.last == "2"
    "nd"
  elsif array.last == "3"
    "rd"
  else
    "th"
  end
end

#List all Academy award winners during the Oscar ceremony specified by the User.
def awards_by_ceremony(ceremony_name)
  string = ""
  nom_array = Nomination.all.where(ceremony: ceremony).where(win: 1)
  nom_array.each {|nom| string = string + "#{nom.category_name}: #{Nominee.all.find(nom.nominee_id).name}\n"}
  suffix = suffix_find(ceremony)
  puts "The #{ceremony}#{suffix} Academy Award winners were:"
  puts
  puts string
  puts
end

#List all the Academy Award winners for the category specified by the User.
def awards_by_category(category_n)
  string = ""
  nom_array = Nomination.all.where(category_name: category_n).where(win: 1)
  nom_array.each {|nom| string = string + "#{Nominee.all.find(nom.nominee_id).name} (#{nom.year+1})\n"}
  puts "The Academy Award for Best #{category_n} has been awarded to the following:"
  puts
  puts string
  puts
end
