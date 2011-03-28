require 'spec_helper'

describe ForumsController do
  
  # let(:valid_category) { Category.new(:name => 'First Forum', :subtitle => 'And my Subtitle') }
  
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
  
end
