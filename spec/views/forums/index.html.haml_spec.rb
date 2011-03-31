require 'spec_helper'

describe "forums/index.html.haml" do
  
  let(:first_category) { stub_model(Category, :name => "First Category", :subtitle => "My Subtitle") }
  
  before :each do
    assign( :categories, [first_category] )
    render
  end
  
  it "should display a table header for categories" do
    
    rendered.should have_selector('thead') do |thead|
      thead.should contain(first_category.name)
    end
    
  end
  
end