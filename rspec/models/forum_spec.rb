require 'spec_helper'

describe Forum do
  
  let(:valid_category) { Category.new(:name => 'wonderful name') }
  let(:forum_without_name) { Forum.new(:subtitle => 'my subtitle', :category => valid_category) }
  let(:forum_without_subtitle) { Forum.new(:name => 'my name', :category => valid_category) }
  let(:forum_without_category) { Forum.new(:name => 'my name', :subtitle => 'my subtitle') }
  
  let(:forum_with_name_and_category) { Forum.new(:name => 'my name', :category => valid_category) }
  let(:dependend_topic) { Topic.new(:title => "my name", :forum => forum_with_name_and_category) }
  
  it "does require a name" do
    forum_without_name.should_not be_valid
  end
  
  it "doesn't require a subtitle" do
    forum_without_subtitle.should be_valid
  end
  
  it "does require a category" do
    forum_without_category.should_not be_valid
  end
  
  it "does destroy all dependent topics" do
    forum_with_name_and_category.save
    dependend_topic.save
    Topic.all.should include(dependend_topic)
    forum_with_name_and_category.destroy
    Topic.all.should_not include(dependend_topic)
  end
  
end
