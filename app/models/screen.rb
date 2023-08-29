class Screen < ApplicationRecord
  belongs_to :theater
  has_one :show, dependent: :destroy
  
  validates  :screen_name , presence: true
  validates  :capacity ,length: {maximum: 80} ,presence: true
end
