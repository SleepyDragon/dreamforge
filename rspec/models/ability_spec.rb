require 'spec_helper'

describe Ability do
  
  let(:ability_with_name_and_description_and_actions) { Ability.new(:name => "Hello", :description => "Hello", :actions => {:test => '123'}) }
  let(:ability_without_name) { Ability.new(:description => "Hello", :actions => {:test => '123'}) }
  let(:ability_without_description) { Ability.new(:name => "Hello", :actions => {:test => '123'}) }
  let(:ability_without_actions) { Ability.new(:name => "Hello", :description => "Hello") }
  
  it "should never change it's type" do
    ability_with_name_and_description_and_actions.should be_valid
    ability_with_name_and_description_and_actions.type = "TakaTuka"
    ability_with_name_and_description_and_actions.should_not be_valid
  end
  
  it "should have a name" do
    ability_without_name.should_not be_valid
  end
  
  it "should have a description" do
    ability_without_description.should_not be_valid
  end
  
  it "should have actions" do
    ability_without_actions.should_not be_valid
  end
  
  it "should not have a fictional author" do
    ability_with_name_and_description_and_actions.fictional_author = "hello"
    ability_with_name_and_description_and_actions.should_not be_valid
  end
  
  it "should serialize the actions hash" do
    ability_with_name_and_description_and_actions.actions[:my_action] = "My Value"
    ability_with_name_and_description_and_actions.save!
    ability_with_name_and_description_and_actions.actions.should have_key(:my_action)
    ability_with_name_and_description_and_actions.actions.should have_value("My Value")
  end
  
end
