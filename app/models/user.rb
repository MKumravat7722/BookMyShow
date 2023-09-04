class User < ApplicationRecord
  has_secure_password
  has_one_attached :image 
  
  has_many :theaters, dependent: :destroy
  has_many :tickets , dependent: :destroy
  has_many :screens , through: :theaters, dependent: :destroy
  
  validates :email,:user_name ,presence: true
  validates :name, presence: true, uniqueness: true
  validate  :validate_email
  
  def validate_email
    if (email =~ /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$/).nil?
      errors.add(:email, 'please enter a valid email')
    end
  end
  def owner?
    type == "Owner"
  end
  def customer?
    type == "Customer"
  end
end
