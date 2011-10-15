require 'spec_helper'

describe Mod do 
  
  it "should be valid" do
    mod = Fabricate.build(:mod)
    mod.must_be_valid
  end
  
  it "should have a name" do
    mod_without_name = Fabricate.build(:mod, name: nil)
    mod_without_name.wont_be_valid
  end
  
  it "should have a description" do
    mod_without_description = Fabricate.build(:mod, description: nil) 
    mod_without_description.wont_be_valid
  end
  
  it "should not have actions" do
    mod_with_actions = Fabricate.build(:mod, actions: "wohoooo!")
    mod_with_actions.wont_be_valid
  end
  
  it "should not have a fictional author" do
    mod_with_author = Fabricate.build(:mod, fictional_author: "Gerry")
    mod_with_author.wont_be_valid
  end
  
  it "should be of type 'Mod'" do
    mod = Fabricate.build(:mod)
    mod.type.must_equal "Mod"
    
    ['mod', 'something', 'pirate'].each do |type|
      mod.type = type
      mod.wont_be_valid
    end
  end
  
end
