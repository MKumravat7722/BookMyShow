class MovieSerializer < ActiveModel::Serializer
  attributes :id,:name, :posters

  def posters
    object&.poster.url
  end
end
