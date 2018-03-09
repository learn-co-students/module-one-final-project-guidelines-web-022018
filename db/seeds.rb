require 'pry'

# Normalize some of the array data

actors_actress = ["Actor", "Actress", "Actor in a Supporting Role","Actress in a Supporting Role","Actor in a Leading Role",
 "Actress in a Leading Role"]
count = 0

def aa_norm
  academy_awards_array = []
  File.open('./db/academy_awards.csv').each do |row|
    academy_awards_array << row.split(",")
  end
  academy_awards_array.map do |nomination|
    nomination.map {|nom| nom.split.join(" ").gsub("\n","")}
  end
end

aa_norm.each do |award|
  if Nominee.all.where(name: award[4]) == []
    nominee = Nominee.create(name: award[4])
    n_id = nominee.id
  else
    n_id = Nominee.all.where(name: award[4]).first.id
  end
  if actors_actress.include?(award[2]) || count <= 73
    if Movie.all.where(name: award[5]) == []
      movie = Movie.create(name: award[5])
      m_id = movie.id
    else
      m_id = Movie.all.where(name: award[5]).first.id
    end
  else
    if Movie.all.where(name: award[4]) == []
      movie = Movie.create(name: award[4])
      m_id = movie.id
    else
      m_id = Movie.all.where(name: award[4]).first.id
    end
  end
  nomination = Nomination.create(category_name: award[2], ceremony: award[1], year: award[0]-1, win: award[3], nominee_id: n_id, movie_id: m_id )
  count += 1
end
