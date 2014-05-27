# == Schema Information
#
# Table name: photographers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Photographer < ActiveRecord::Base
  has_many :photos
  
  email_regex = /\A[\w0-9._%+-]+@[a-z\d.-]+\.[a-z]+\z/i
  validates :name, presence: true, length: { in: 2..255 }
  validates :email, 
            presence: true, 
            length: { in: 4..255 }, 
            format: { with: email_regex },
            uniqueness: { case_sensitive: false }
end
