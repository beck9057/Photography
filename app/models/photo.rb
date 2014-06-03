# == Schema Information
#
# Table name: photos
#
#  id                 :integer          not null, primary key
#  photographer_id    :integer
#  event_id           :integer
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#  description        :string(255)
#  is_landscape       :boolean
#

class Photo < ActiveRecord::Base
  has_attached_file :image, {
    :styles => {thumb: "x100", small: "x200", medium: "x400", large: "x800", giant: "x1000"},
    :convert_options => { thumb: "-quality 75 -strip", small: "-quality 75 -strip", medium: "-quality 75 -strip", large: "-quality 75 -strip", giant: "-quality 75 -strip" }
  }
    
  validates :image, 
            presence: true
            
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  
  before_post_process :check_file_size
  
  before_save :set_orientation

  protected
  
  def check_file_size
    valid?
    errors[:image_file_size].blank?
  end
  
  def set_orientation
    img = self.image
    geo = Paperclip::Geometry.from_file(Paperclip.io_adapters.for(img.styles[:thumb])) 
    ratio = geo.width/geo.height
    self[:is_landscape] = ratio > 1
    return
  end
  
end
