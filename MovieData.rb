require "./MovieTest.rb"
require "./MovieItem.rb"
class MovieData
@@movie_array = Array.new(944) {Hash.new}
@@test_set = nil
@@training_set = nil
def initialize(set)
  if set.eql?("all")
    @@training_set = open("u.data")
  else
    @@training_set = open("#{set}.base")
    @@test_set = open("#{set}.test")
end
  @@training_set.each do |s|
    temp = s.split
    user = temp[0].to_i
    movie = temp[1].to_i
    rating = temp[2].to_i
    @@movie_array[user].store(movie, rating)
  end
end

def rating(user,movie)
    temp = @@movie_array
    if temp[user].has_key?(movie)
    return temp[user][movie]
    else
    return 0
    end
end

def movies(user)
    return @@movie_array[user].keys
end


def viewers(movie)
  viewers_array = []
  count = 1;
  @@movie_array.each do |i|
    if i.has_key?(movie)
    viewers_array.push(count)
    end
    count = count +1
  end
  return viewers_array
end



def predict(user, movie)
  total_rating = 0;
  @@movie_array.each do |i|
    if i.has_key?(movie)
    total_rating = total_rating + i[movie]
    end
  end
  all_viewers = viewers(movie).length
  return total_rating/all_viewers.to_f
end

def run_test(k_ratings)
  test_array = Array.new(k_ratings)
  @@training_set.seek(0)
  (0..k_ratings-1).each do |i|
    if @@test_set == nil
    s = @@training_set.gets.chomp
  else
    s = @@test_set.gets.chomp
  end
    temp = s.split
    test_array[i] = MovieItem.new(temp[0], temp[1], temp[2], predict(temp[0].to_i, temp[1].to_i))
  end
  return MovieTest.new(test_array)
end



end



z = MovieData.new("all")
m =  z.run_test(100)
