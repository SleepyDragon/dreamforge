require 'spec_helper'

describe Ability do
  
  it "should be valid" do
    ability = Fabricate.build(:ability)
    ability.must_be_valid
  end
  
  it "should have a name" do
    ability_without_name = Fabricate.build(:ability, name: nil)
    ability_without_name.wont_be_valid
  end

  it "should have a description" do
    ability_without_description = Fabricate.build(:ability, description: nil)
    ability_without_description.wont_be_valid
  end
  
  it "should have actions" do
    ability_without_actions = Fabricate.build(:ability, actions: nil)
    ability_without_actions.wont_be_valid
  end
  
  it "should not have a fictional author" do
    ability_with_author = Fabricate.build(:ability, fictional_author: "Guybrush")
    ability_with_author.wont_be_valid
  end
  
  it "should be of type 'Action'" do
    ability = Fabricate.build(:ability)
    ability.type.must_equal 'Ability'
    
    ['ability', 'attack', 'magic'].each do |type|
      ability.type = type
      ability.wont_be_valid
    end
  end
  
  it "should serialize the actions hash" do
    ability = Fabricate.build(:ability)
    ability.actions = { shoot: 'BOOM!', punch: 'SMACK!' }
    
    ability.save!
    ability.actions.keys.must_include :shoot
    ability.actions.values.must_include 'BOOM!'
    ability.actions.keys.must_include :punch
    ability.actions.values.must_include 'SMACK!'
  end
  
end
