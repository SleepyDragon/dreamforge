describe Profession do
  
  it "should be valid" do
    profession = Fabricate.build(:profession)
    profession.must_be_valid
  end
  
  it "should have a name" do
    profession_without_name = Fabricate.build(:profession, name: nil)
    profession_without_name.wont_be_valid
  end
  
  it "should have a description" do
    profession_without_description = Fabricate.build(:profession, description: nil)
    profession_without_description.wont_be_valid
  end
  
  it "should not have actions" do
    profession_with_actions = Fabricate.build(:profession, actions: "some actions...")
    profession_with_actions.wont_be_valid
  end
  
  it "should not have a fictional author" do
    profession_with_author = Fabricate.build(:profession, fictional_author: "Author")
    profession_with_author.wont_be_valid
  end
  
  it "should be of type 'Profession'" do
    profession = Fabricate.build(:profession)
    profession.type.must_equal 'Profession'
    
    ['profession', 'Ability', 'Mod'].each do |type|
      profession.type = type
      profession.wont_be_valid
    end
  end
  
end
