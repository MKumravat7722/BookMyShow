class Theater < ApplicationRecord
  
  belongs_to :user
  has_many :screens, dependent: :destroy
  accepts_nested_attributes_for :screens
  has_many :shows, through: :screens, dependent: :destroy
  
  
  validates :name , :location, presence: true 
end
