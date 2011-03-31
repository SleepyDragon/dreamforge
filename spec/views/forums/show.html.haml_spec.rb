require 'spec_helper'

describe "forums/show.html.haml" do
  
  before :each do
    @corresponding_category = stub_model(Category, :name => "First Category", :subtitle => "My Subtitle")
    @forum_that_should_be_shown = stub_model(Forum, :name => "First Forum", :subtitle => "My Subtitle", :category => @corresponding_category)
    
    assign( :forum, @forum_that_should_be_shown )
    render
  end
  
  it "should display the correct headline" do
    
    rendered.should have_selector('h2', :content => @forum_that_should_be_shown.name)
    
  end
  
  it "should display the correct breadcrumbs" do
    
    rendered.should have_selector('.breadcrumbs') do |breadcrumb|
      breadcrumb.should have_selector('li', :content => @forum_that_should_be_shown.name)
      breadcrumb.should have_selector('li', :content => @corresponding_category.name)
    end
    
  end
  
end