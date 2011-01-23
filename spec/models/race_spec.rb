require 'spec_helper'

describe Race do
  
  let(:empty_with_name_and_description) { Race.new(:name => "Hello", :description => "Hello") }
  let(:race_without_name) { Race.new(:description => "Hello") }
  let(:race_without_description) { Race.new(:name => "Hello") }
  
  it "should never change it's type" do
    empty_with_name_and_description.should be_valid
    empty_with_name_and_description.type = "TakaTuka"
    empty_with_name_and_description.should_not be_valid
  end
  
  it "should have a name" do
    race_without_name.should_not be_valid
  end
  
  it "should have a description" do
    race_without_description.should_not be_valid
  end
  
  it "should not have actions" do
    empty_with_name_and_description.actions = "hello"
    empty_with_name_and_description.should_not be_valid
  end
  
  it "should not have a fictional author" do
    empty_with_name_and_description.fictional_author = "hello"
    empty_with_name_and_description.should_not be_valid
  end
  
end
