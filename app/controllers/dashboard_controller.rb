class DashboardController < ApplicationController
  
  before_action :hide_from_unauthenticated
  
  def index
  end
end
