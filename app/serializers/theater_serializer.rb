class TheaterSerializer < ActiveModel::Serializer
  attributes :id, :name, :location,:user_id
  has_many :screens
end
