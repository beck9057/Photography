class PagesController < ApplicationController
  def gallery
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
end
