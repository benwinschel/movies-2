require "./MovieItem.rb"
class MovieTest
attr_accessor :movies
def initialize(list)
  @movies = list
end

def mean
  #computes average error by summing up every movieItem error and dividing it by
  #number of MovieItem objects
  total = 0;
  movies.each do |i|
  total = total + (i.rating.to_f - i.predicted_rating.to_f).abs
end
return total/movies.length.to_f
end

def stddev
  #computes standard deviation between average error value and actual error value
  #for each object
  avg = mean
  sum = 0
  movies.each do |i|
    sum  = sum + (((i.rating.to_f - i.predicted_rating.to_f) - (avg)).abs * ((i.rating.to_f - i.predicted_rating.to_f) - (avg)).abs)
end
return Math.sqrt(sum.to_f/movies.length)
end


def rms
  #standard deviation between real rating and predicted rating
  sum = 0
  movies.each do |i|
    sum = sum + ((i.rating.to_f - i.predicted_rating.to_f).abs * (i.rating.to_f - i.predicted_rating.to_f).abs)
  end
  return Math.sqrt(sum.to_f/movies.length)
end


def to_a
  #although movieTest is already an array, this method returns an array copy of the MovieTest object
  return movies.to_a
end
end
