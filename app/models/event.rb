# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  client_id   :integer
#  title       :string(255)
#  kind        :string(255)
#  description :string(255)
#  date        :date
#  created_at  :datetime
#  updated_at  :datetime
#

class Event < ActiveRecord::Base
  has_many :photos
end
