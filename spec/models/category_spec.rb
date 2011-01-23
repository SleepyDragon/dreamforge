require 'spec_helper'

describe Category do
  
  let(:invalid_category) { Category.new(:subtitle => 'my subtitle') }
  let(:valid_category) { Category.new(:name => 'my name') }
  let(:existing_category) { Category.new(:name => 'my name') }
  let(:dependent_forum) { Forum.new(:name => 'forum name', :category => existing_category) }
  
  it "does require a name" do
    invalid_category.should_not be_valid
  end
  
  it "doesn't require a subtitle" do
    valid_category.should be_valid
  end
  
  it "does destroy all dependent forums" do
    existing_category.save
    dependent_forum.save
    Forum.all.should include(dependent_forum)
    existing_category.destroy
    Forum.all.should_not include(dependent_forum)
  end
  
end
