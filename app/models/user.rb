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
  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end
  def password_token_valid?
    (self.reset_password_sent_at + 4.hours) > Time.now.utc
  end
  def reset_password!(password)
    self.reset_password_token = nil
    self.password = password
    save!
  end
  private
  def generate_token
    SecureRandom.hex(10)
  end

end
