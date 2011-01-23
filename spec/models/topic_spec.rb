require 'spec_helper'

describe Topic do
  let(:topic_without_a_forum) { Topic.new(:title => "my name") }
  let(:topic_without_a_title) { Topic.new(:forum => valid_forum) }
  let(:topic_with_a_title_and_forum) { Topic.new(:title => "my name", :forum => valid_forum) }
  let(:valid_forum) { Forum.new(:name => "some foxy name") }
  
  it "does require a title" do
    topic_without_a_title.should_not be_valid
  end
  
  it "does require a forum" do
    topic_without_a_forum.should_not be_valid
  end
  
  it "accepts valid forums" do
    topic_with_a_title_and_forum.should be_valid
  end
  
end
