describe Rule do
  
  it "should be valid" do
    rule = Fabricate.build(:rule)
    rule.must_be_valid
  end
  
  it "should have a name" do
    rule_without_a_name = Fabricate.build(:rule, name: nil)
    rule_without_a_name.wont_be_valid
  end
  
  it "should not have actions" do
    rule_with_actions = Fabricate.build(:rule, actions: "pirateers!")
    rule_with_actions.wont_be_valid
  end
  
  it "should not have a humble, fictional author" do
    rule_with_author = Fabricate.build(:rule, fictional_author: "Blackbeard")
    rule_with_author.wont_be_valid
  end
  
  it "should be of type 'Rule'" do
    rule = Fabricate.build(:rule)
    rule.type.must_equal "Rule"
    
    # No type other than 'Rule' is allowed.
    ["rule", "pirate", "another type"].each do |type|
      rule.type = type
      rule.wont_be_valid
    end
  end
  
end
