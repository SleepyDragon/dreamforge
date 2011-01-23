require 'spec_helper'

describe Mod do
  
  let(:empty_with_name_and_description) { Mod.new(:name => "Hello", :description => "Hello") }
  let(:mod_without_name) { Mod.new(:description => "Hello") }
  let(:mod_without_description) { Mod.new(:name => "Hello") }
  
  it "should never change it's type" do
    empty_with_name_and_description.should be_valid
    empty_with_name_and_description.type = "TakaTuka"
    empty_with_name_and_description.should_not be_valid
  end
  
  it "should have a name" do
    mod_without_name.should_not be_valid
  end
  
  it "should have a description" do
    mod_without_description.should_not be_valid
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
