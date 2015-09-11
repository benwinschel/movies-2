#wrapper class that is used in the creation of k rating objects
# that are then put ito an array and returned as a movieTest object.
#so these little organizational objects make up the essence of the test class
class MovieItem
  attr_accessor :user, :movie, :rating, :predicted_rating

  def initialize(user, movie, rating, predicted_rating)
    @user = user
    @movie = movie
    @rating = rating
    @predicted_rating = predicted_rating
  end

end
