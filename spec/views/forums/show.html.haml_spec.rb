require 'spec_helper'

describe "forums/show.html.haml" do
  
  before :each do
    @corresponding_category = stub_model(Category, :name => "First Category", :subtitle => "My Subtitle")
    
    @topics = []
    13.times do |number|
      @topics << stub_model(Topic, :title => "Topic #{number}")
    end
    
    @forum_that_should_be_shown = stub_model(Forum, :name => "First Forum", :subtitle => "My Subtitle", :category => @corresponding_category, :topics => @topics)
    
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
      breadcrumb.should have_selector('li a', :content => t(:community), :href => "/forums")
    end
    
  end
  
  it "should display a table with the first ten topics" do
    first_ten_topics = @topics[0,10]
    
    rendered.should have_selector('table tr') do |row|
      first_ten_topics.each do |topic|
        row.should have_selector('td', :content => topic.title)
      end
    end
    
  end
  
  it "should not display more than ten topics"
  
end