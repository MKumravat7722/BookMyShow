class Movie < ApplicationRecord
   has_many :shows ,dependent: :destroy
   
   validates :name, presence: true
end
