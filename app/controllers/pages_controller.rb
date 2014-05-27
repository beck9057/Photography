class PagesController < ApplicationController
  def gallery
    @title = "Gallery"
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
end
