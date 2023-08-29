class ShowSerializer < ActiveModel::Serializer
   attributes :id, :movie, :theater

  def theater
    object.screen.theater.name
  end
  def movie
    object.movie.name
  end
end
