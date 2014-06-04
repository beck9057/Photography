class PortfolioController < ApplicationController
  def index
      @photos = Photo.all
      @title = "Portfolio"
  end
end
