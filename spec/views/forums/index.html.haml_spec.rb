require 'spec_helper'

describe "forums/index.html.haml" do
  
  before(:each) do
    @category = mock_model(Category, :name => "First Category", :subtitle => "My Subtitle")
    assigns[:categories] = [@category]
  end
  
  it "should display a table header for categories" do
    render "forums/index"
    response.should have_tag("thead") do
      with_tag("td", @category.name)
    end
  end
  
end