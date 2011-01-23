require 'spec_helper'

describe Story do
  
  let(:empty_with_name_and_description_and_fictional_author) { Story.new(:name => "Hello", :description => "Hello", :fictional_author => "Alibert") }
  let(:story_without_name) { Story.new(:description => "Hello", :fictional_author => "Alibert") }
  let(:story_without_description) { Story.new(:name => "Hello", :fictional_author => "Alibert") }
  let(:empty_without_fictional_author) { Story.new(:name => "Hello", :description => "Hello") }
  
  it "should never change it's type" do
    empty_with_name_and_description_and_fictional_author.should be_valid
    empty_with_name_and_description_and_fictional_author.type = "TakaTuka"
    empty_with_name_and_description_and_fictional_author.should_not be_valid
  end
  
  it "should have a name" do
    story_without_name.should_not be_valid
  end
  
  it "should have a description" do
    story_without_description.should_not be_valid
  end
  
  it "should not have actions" do
    empty_with_name_and_description_and_fictional_author.actions = "hello"
    empty_with_name_and_description_and_fictional_author.should_not be_valid
  end
  
  it "should not have a fictional author" do
    empty_without_fictional_author.should_not be_valid
  end
  
end
