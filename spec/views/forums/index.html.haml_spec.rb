require 'spec_helper'

describe "forums/index.html.haml" do
  
  before :each do
    @first_forum = stub_model(Forum, :name => "First Forum", :subtitle => "My Subtitle")
    @first_category = stub_model(Category, :name => "First Category", :subtitle => "My Subtitle", :forums => [@first_forum])
    
    assign( :categories, [@first_category] )
    render
  end
  
  it "should display a table header for each category" do
    
    rendered.should have_selector('thead') do |thead|
      thead.should contain(@first_category.name)
    end
    
  end
  
  it "should list all corresponding forums" do
    
    rendered.should have_selector('tbody tr') do |tbody|
      tbody.should contain(@first_forum.name)
    end
    
  end
  
  it "should link to the correct forum" do
    
    rendered.should have_selector('tbody td a', :content => @first_forum.name, :href => "/forums/#{@first_forum.to_param}")
    
  end
  
end