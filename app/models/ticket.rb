class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :show
  validates :ticket_purchased, presence: true
  
  before_create :generate_unique_id
  
  private 
  def generate_unique_id
    unique_id = SecureRandom.hex(4) 
    self.unique_id = unique_id
  end
end
