describe Story do
  
  it "should be valid" do
    story = Fabricate.build(:story)
    story.must_be_valid
  end
  
  it "should have a name" do
    story_without_a_cool_sounding_name = Fabricate.build(:story, name: nil)
    story_without_a_cool_sounding_name.wont_be_valid
  end
  
  it "should have a description" do
    story_without_description = Fabricate.build(:story, description: nil)
    story_without_description.wont_be_valid
  end
  
  it "should not have actions" do
    story_with_actions = Fabricate.build(:story, actions: "read me!")
    story_with_actions.wont_be_valid
  end
  
  it "should be of type 'Story'" do
    # The type should be 'Story' and only 'Story' it should be.
    # Not should it be 'Store', and even 'Toy Story' is wrong.
    # 'Storage' is totally out of the question...
    
    story = Fabricate.build(:story)
    story.type.must_equal 'Story'
    
    ['Store', 'story', 'Toy Story', 'Storage'].each do |type|
      story.type = type
      story.wont_be_valid
    end
    
  end
  
end

