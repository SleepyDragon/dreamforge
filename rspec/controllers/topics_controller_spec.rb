require 'spec_helper'

describe TopicsController do

  describe "GET 'show'" do
    before :each do
      @topic = stub_model(Topic, :title => "Topic")
      
      Topic.stub!(:find).and_return(@topic)
    end
    
    it "should be succesful" do
      
      get :show, :id => 1
      response.should be_success
      
    end
  end

end
