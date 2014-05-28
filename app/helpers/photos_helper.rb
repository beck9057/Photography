module PhotosHelper
  
  def photographer_name(id: @photo.photographer_id)
    p = Photographer.find_by_id(id)
    if !p.nil?
      p.name
    else
      "nil"
    end
  end
  
  def event_name(id: @photo.event_id)
    e = Event.find_by_id(id)
    if !e.nil?
      e.title
    else
      "nil"
    end
  end
  
end
