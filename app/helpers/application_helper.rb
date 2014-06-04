module ApplicationHelper
  #Return a title on a per-page basis
    def title
      base_title = "Kyle Falconer Photography"
      if @title.nil?
        base_title
      else
        "#{@title} | #{base_title}"
      end
    end
  
    def logo
      image_tag("logo.png", :alt => "Kyle Falconer Photography", :class => "pure-u-1 SiteLogo")
    end
    
    def orientation(o: @photo.is_landscape)
       (o ? "landscape" : "portrait")
    end
end
