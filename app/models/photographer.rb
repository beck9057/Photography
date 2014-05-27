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
  
  attr_accessible :name, :email
  
end
