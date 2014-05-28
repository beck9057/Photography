# == Schema Information
#
# Table name: photographers
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#

class Photographer < ActiveRecord::Base
  has_many :photos
    
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  
  validates :name, 
            presence: true, 
            length: { in: 2..255 }
  validates :email, 
            presence: true, 
            length: { in: 4..255 }, 
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password,
            length: { minimum: 6 },
            on: :create
            
  before_save { email.downcase! }
            
  has_secure_password
  
end
