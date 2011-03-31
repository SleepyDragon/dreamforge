require 'spec_helper'

describe ForumsController do
  
  describe 'index' do
    
    it "should be succesful" do
      
      get :index
      response.should be_success
      
    end
    
    it "should render the index template" do
      
      get :index
      response.should render_template(:index)
      
    end
    
    it "should collect all categories" do
      
      @category = mock_model(Category, :name => "First Category", :subtitle => "My Subtitle")
      Category.stub!(:all).and_return([@category])
      get :index
      assigns[:categories].should include(@category)
      
    end
    
  end
  
  describe 'show' do
    
    before :each do
      
      @forum = mock_model(Forum, :name => "First Category", :subtitle => "My Subtitle")
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
    
  end
  
end
