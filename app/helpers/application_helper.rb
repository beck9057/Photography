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
  
    def masthead_logo
      link_to image_tag("kf-photography-logo.png", :alt => "Kyle Falconer Photography", :width => 300, :height => 88),
      	root_path,
        :class => "pure-u-1 SiteLogo pure-menu-heading"
    end
 
    def orientation(o: @photo.is_landscape)
       (o ? "landscape" : "portrait")
    end
end
