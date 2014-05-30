class PagesController < ApplicationController
  def gallery
    @title = "Portfolio"
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
end
