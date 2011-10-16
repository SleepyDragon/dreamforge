require 'spec_helper'

describe ForumsController do
  describe 'show' do

    before :each do
      @topic = mock_model(Topic, :title => "Topic")
      @forum = mock_model(Forum, :name => "First Category", :subtitle => "My Subtitle", :topics => [@topic])
      Forum.stub!(:find).and_return(@forum)
    end
    
    it "should be succesful" do
      
      get :show, :id => 1
      response.should be_success
      
    end
    
    it "should render the show template" do
      
      get :show, :id => 1
      response.should render_template(:show)
      
    end
    
    it "should save the forum in the assigns array" do
      
      get :show, :id => 1
      assigns[:forum].should be(@forum)
      
    end
    
    it "should save the corresponding topics in the assigns array" do
      
      get :show, :id => 1
      assigns[:topics].should include(@topic)
      
    end
    
    it "should only send the first ten topics"
    
    it "should not send more than ten topics"
    
  end
  
end
