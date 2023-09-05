class Movie < ApplicationRecord
   has_many :shows ,dependent: :destroy
   has_one_attached :poster
   validates :name, presence: true
end
