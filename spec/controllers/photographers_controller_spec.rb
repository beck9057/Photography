require 'spec_helper'

describe PhotographersController do
  render_views
  
  describe "GET 'show'" do
    
    before(:each) do
      @photographer = create(:photographer)
    end
    
    it "should be successful" do
      get :show, :id => @photographer
      response.should be_success
    end
  end
  
end