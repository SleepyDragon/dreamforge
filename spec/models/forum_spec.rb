require 'spec_helper'

describe Forum do
  
  let(:valid_category) { Category.new(:name => 'wonderful name') }
  let(:forum_without_name) { Forum.new(:subtitle => 'my subtitle', :category => valid_category) }
  let(:forum_without_subtitle) { Forum.new(:name => 'my name', :category => valid_category) }
  let(:forum_without_category) { Forum.new(:name => 'my name', :subtitle => 'my subtitle') }
  
  it "does require a name" do
    forum_without_name.should_not be_valid
  end
  
  it "doesn't require a subtitle" do
    forum_without_subtitle.should be_valid
  end
  
  it "does require a category" do
    forum_without_category.should_not be_valid
  end
  
end
