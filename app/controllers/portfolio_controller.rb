class PortfolioController < ApplicationController
  def index
      @photos = Photo.all
      @gallery_photos = Photo.where(show_on_gallery: true)
      @slideshow_photos = Photo.where(show_on_slideshow: true)
      @title = "Portfolio"
  end
end
