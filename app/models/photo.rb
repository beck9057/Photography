# == Schema Information
#
# Table name: photos
#
#  id              :integer          not null, primary key
#  photographer_id :integer
#  event_id        :integer
#  url             :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Photo < ActiveRecord::Base
    attr_accessible :url, :event_id, :photographer_id
end
