require "spec_helper"

describe Race do
  it "should have a name" do
    race_without_a_name = Fabricate.build(:race, :name => nil)
    race_without_a_name.wont_be_valid
  end
  
  it "should have a description" do
    race_without_a_description = Fabricate.build(:race, :description => nil)
    race_without_a_description.wont_be_valid
  end
  
  it "should never change it's type" do
    race = Fabricate.build(:race)
    race.must_be_valid
    race.type = "TakaTuka"
    race.wont_be_valid
  end
  
  it "should not have actions" do
    race_with_actions = Fabricate.build(:race, :actions => "hello")
    race_with_actions.wont_be_valid
  end
  
  it "should not have a fictional author" do
    race_with_author = Fabricate.build(:race, :fictional_author => "Author")
    race_with_author.wont_be_valid
  end
end


