class Photo < ActiveRecord::Base
  has_attached_file :image, {
      :styles => {thumb: "x100", small: "x200", medium: "x400", large: "x800", giant: "x1000"},
      :convert_options => { thumb: "-quality 70 -strip", small: "-quality 70 -strip", medium: "-quality 70 -strip", large: "-quality 70 -strip", giant: "-quality 70 -strip" }
    }
  validates :image, 
            presence: true
            
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  
  before_post_process :check_file_size

  def check_file_size
    valid?
    errors[:image_file_size].blank?
  end
end
